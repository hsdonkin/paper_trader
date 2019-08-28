class Portfolio < ApplicationRecord
  def self.stock_summary(user)
    stock_array = []
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

  def self.trade_summary(user)
    trades_array = []
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
