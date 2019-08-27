
require 'byebug'

class Stock < ApplicationRecord
  has_many :values
  has_many :users, through: :portfolios
  has_many :trades

  include API

  def self.search(query)
    RestClient::Request.execute(
      method: :get,
      url: "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=#{query}&apikey=#{ENV['ALPHA_VANTAGE_API_KEY']}")
  end

  def self.populate_stock_table(query)
    search = JSON.parse(Stock.search(query))["bestMatches"].first
    symbol = search["1. symbol"]
    name = search["2. name"]
    # region = search["4. region"]
    volume = Stock::Call.current_volume(symbol)
    current_price = Stock::Call.current_price(symbol)
    # daily_open = Stock::Call.daily_open(symbol)
    # weekly_open = Stock::Call.weekly_open(symbol)
    # monthly_open = Stock::Call.monthly_open(symbol)
    if Stock.find_by_symbol(symbol) == nil || Stock.find_by_name(name) == nil
      stock = Stock.new(:symbol => symbol, :name => name, :current_price => current_price, :volume => volume)
      stock.save

    else
      stock = Stock.find_by_name(name)
      stock.update(:current_price => current_price, :volume => volume)
    end
    stock
  end

end
