class Portfolio < ApplicationRecord
  def self.stock_summary(user)
    stock_array = []
    if user
      @portfolio = Portfolio.where({user_id: [user.id]})
      @portfolio.each do |f|
        @stock = Stock.find_by_id(f["stock_id"])
        stock_array.push({:symbol => @stock.symbol,
          :quantity => f["shares"],
          :equity => f["shares"] * @stock.current_price,
          :stock_id => @stock.id})
        end
        stock_array
    end
  end

  def self.trade_summary(user)
    trades_array = []
    if user
      @trades = Trade.where({user_id: [user.id]})
      @trades.each do |t|
        @stock = Stock.find_by_id(t["stock_id"])
        trades_array.push({:date => t["log_time"].to_s.split[0],
          :symbol => @stock.symbol,
          :quantity => t["quantity"],
          :price => t["buy_sell_price"]})
        end
        trades_array
    end
  end

  def self.total_equity(user)
    sum = 0
    if user 
      @portfolio = Portfolio.where({user_id: [user.id]})
      @portfolio.each do |p|
        @stock = Stock.find_by_id(p["stock_id"])
        sum += @stock.current_price * p["shares"]
      end
      sum += user.cash
    end
  end

  def self.leaderboard
    users = User.all
    user_performance = []
    users.each do |s|
      equity = Portfolio.total_equity(s)
      user_performance.push([s.username, equity])
    end
    user_performance.sort {|a,b| a[1] <=> b[1]}.reverse
  end

end
