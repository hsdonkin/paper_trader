require 'googlecharts'
class Stock < ApplicationRecord
  has_many :values
  has_many :users, through: :portfolios
  has_many :trades

  def self.search(query)
    RestClient::Request.execute(
      method: :get,
      url: "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=#{query}&apikey=#{ENV['ALPHA_VANTAGE_API_KEY']}")
  end

  def self.populate_stock_table(query)
    search = JSON.parse(Stock.search(query))["bestMatches"].first
    symbol = search["1. symbol"]
    name = search["2. name"]
    region = search["4. region"]
    if Stock.find_by_symbol(symbol) == nil || Stock.find_by_name(name) == nil
      stock = Stock.new(:symbol => symbol, :name => name)
      stock.save
      # add current price method to stock
      # add region column to stock table
      # add Quote Endpoint to find current price method 
    end
  end



end
