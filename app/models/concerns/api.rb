require 'byebug'
module API
  class Call

    def self.current_price(symbol)
      call = RestClient::Request.execute(
        method: :get,
        url: "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=#{symbol}&apikey=#{ENV['ALPHA_VANTAGE_API_KEY']}")
        JSON.parse(call)["Global Quote"]["05. price"]
    end

    def self.daily(symbol)
      RestClient::Request.execute(
        method: :get,
        url: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=#{symbol}&interval=5min&apikey=#{ENV['ALPHA_VANTAGE_API_KEY']}")
    end

    def self.daily_open(symbol)
      call = RestClient::Request.execute(
        method: :get,
        url: "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=#{symbol}&apikey=#{ENV['ALPHA_VANTAGE_API_KEY']}")
        JSON.parse(call)["Time Series (Daily)"].first[1]["1. open"]
    end

    def self.weekly_open(symbol)
      call = RestClient::Request.execute(
        method: :get,
        url: "https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY_ADJUSTED&symbol=#{symbol}&apikey=#{ENV['ALPHA_VANTAGE_API_KEY']}")
        JSON.parse(call)["Weekly Adjusted Time Series"].first[1]["1. open"]
    end

    def self.monthly_open(symbol)
      call = RestClient::Request.execute(
        method: :get,
        url: "https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY_ADJUSTED&symbol=#{symbol}&apikey=#{ENV['ALPHA_VANTAGE_API_KEY']}")
        JSON.parse(call)["Monthly Adjusted Time Series"].first[1]["1. open"]
    end



  end
end
