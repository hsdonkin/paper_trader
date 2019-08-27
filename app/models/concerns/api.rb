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




  end
end
