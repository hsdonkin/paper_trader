
require 'byebug'

class Stock < ApplicationRecord
  has_many :values
  has_many :users, through: :portfolios
  has_many :trades

  include API

  def self.search(query)

    search_tables = Stock.where("symbol || name  ILIKE ?", "%#{query}%")
    if search_tables.length == 0
      a = RestClient::Request.execute(
          method: :get,
          url: "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=#{query}&apikey=#{Stock::Call.apikey_toggle}")
        search = JSON.parse(a)["bestMatches"].first
        symbol = search["1. symbol"]
        name = search["2. name"]
        Stock.populate_new_stock(symbol, name)
    else
      symbol = search_tables[0].symbol
      Stock.update_stock(symbol)
    end
  end

  def self.populate_new_stock(symbol, name)
    volume = Stock::Call.current_volume(symbol)
    current_price = Stock::Call.current_price(symbol)
    daily_open = Stock::Call.daily_open(symbol)
    stock = Stock.new(:symbol => symbol, :name => name, :current_price => current_price, :daily_open => daily_open, :volume => volume)
    stock.save
    stock
  end

  def self.update_stock(symbol)
    stock = Stock.find_by_symbol(symbol)

    if stock.updated_at < Time.now.utc - 300
      volume = Stock::Call.current_volume(symbol)
      current_price = Stock::Call.current_price(symbol)
      daily_open = Stock::Call.daily_open(symbol)
      stock.update(:current_price => current_price, :daily_open => daily_open, :volume => volume)

    end
    stock
  end

  def gain_check
    if self.current_price < self.daily_open
      self.update(:gain => false)
    else
      self.update(:gain => true)
    end
  end

end
