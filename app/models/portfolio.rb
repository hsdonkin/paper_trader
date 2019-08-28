class Portfolio < ApplicationRecord
  def self.stock_summary(user)
    stock_array = []
    @portfolio = Portfolio.where({user_id: [user.id]})
    @portfolio.each do |f|
      @stock = Stock.find_by_id(f["stock_id"])
      shares = f["shares"]
      symbol = @stock.symbol
      equity = shares * @stock.current_price
      stock_array.push("Stock: #{symbol} | Quantity: #{shares} | Equity: #{equity}")
    end
    stock_array
  end

  def self.trade_summary(user)
    trades_array = []
    @trades = Trade.where({user_id: [user.id]})
    @trades.each do |t|
      @stock = Stock.find_by_id(t["stock_id"])
      trades_array.push("Date: #{t["log_time"]} | Stock: #{@stock.symbol} | Quantity: #{t["quantity"]} | Price: #{t["buy_sell_price"]}")
    end
    trades_array
  end
end
