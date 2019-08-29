module API
  class Call

  # @@api_counter = 0

   # def ENV['ALPHA_VANTAGE_API_KEY']
   #   api_arr = [ENV['ALPHA_VANTAGE_API_KEY'], ENV['ALPHA_VANTAGE_API_KEY2'], ENV['ALPHA_VANTAGE_API_KEY3'], ENV['ALPHA_VANTAGE_API_KEY4'], ENV['ALPHA_VANTAGE_API_KEY5'],
   #   ENV['ALPHA_VANTAGE_API_KEY6'], ENV['ALPHA_VANTAGE_API_KEY7'],
   #   ENV['ALPHA_VANTAGE_API_KEY8'], ENV['ALPHA_VANTAGE_API_KEY9'],
   #   ENV['ALPHA_VANTAGE_API_KEY10']]
   #
   #   if @@api_counter < api_arr.length - 1
   #     @@api_counter += 1
   #     api_arr[@@api_counter]
   #   else
   #     @@api_counter = 0
   #     api_arr[@@api_counter]
   #   end
   # end

    def self.current_volume(symbol)
      call = RestClient::Request.execute(
        method: :get,
        url: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=#{symbol}&interval=30min&apikey=#{ENV['ALPHA_VANTAGE_API_KEY']}")
        JSON.parse(call)["Time Series (30min)"].first[1]["5. volume"]
    end

    def self.current_price(symbol)

      call = RestClient::Request.execute(
        method: :get,
        url: "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=#{symbol}&apikey=#{ENV['ALPHA_VANTAGE_API_KEY']}")
        JSON.parse(call)["Global Quote"]["05. price"]
    end

    def self.daily(symbol)
      RestClient::Request.execute(
        method: :get,
        url: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=#{symbol}&interval=15min&outputsize=compact&apikey=#{ENV['ALPHA_VANTAGE_API_KEY']}")
    end

    def self.daily_open(symbol)
      call = RestClient::Request.execute(
        method: :get,
        url: "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=#{symbol}&apikey=#{ENV['ALPHA_VANTAGE_API_KEY']}")
        counter = 0
        while JSON.parse(call)["Time Series (Daily)"] == nil
          sleep(2)
          call = RestClient::Request.execute(
            method: :get,
            url: "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=#{symbol}&apikey=#{ENV['ALPHA_VANTAGE_API_KEY']}")
            counter += 1
            if counter == 5
              break
            end
        end
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
