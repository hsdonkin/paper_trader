
require 'byebug'

class Stock < ApplicationRecord
  has_many :values
  has_many :users, through: :portfolios
  has_many :trades

  include API

  def self.search(query)
  RestClient::Request.execute(
      method: :get,
      url: "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=#{query}&apikey=#{Stock::Call.apikey_toggle}")
  end


  def self.populate_stock_table(query)
    search = JSON.parse(Stock.search(query))["bestMatches"].first
    symbol = search["1. symbol"]
    if Stock.find_by_symbol(symbol) == nil
      Stock.populate_new_stock(symbol)
    else
      Stock.update_stock(symbol)
    end
  end

  def self.populate_new_stock(symbol)
    volume = Stock::Call.current_volume(symbol)
    current_price = Stock::Call.current_price(symbol)
    daily_open = Stock::Call.daily_open(symbol)
    stock = Stock.new(:symbol => symbol, :name => name, :current_price => current_price, :daily_open => daily_open, :volume => volume)
    stock.save
    stock
  end

  def self.update_stock(symbol)
    stock = Stock.find_by_name(symbol)
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
