class Stock < ApplicationRecord
  has_many :values
  has_many :users, through: :portfolios
  has_many :trades

  def daily(symbol)
    RestClient::Request.execute(
      method: :get,
      url: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=#{symbol}&interval=5min&apikey=#{ENV['ALPHA_VANTAGE_API_KEY']}")
  end

  def get_current_price(symbol)
    JSON.parse(self.daily(symbol))["Time Series (5min)"].first[1]["4. close"]
  end

end
