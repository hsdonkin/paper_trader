class UsersController < ApplicationController

  def index
    render :index
  end

  def buy_stock(stock, quantity)
    @stock = stock
    @quantity = quantity
    @user = current_user
    @stock_hold = @stock.current_price * @quantity

    if @user.cash >= @stock_hold
      trade = Trade.new(:user => @user, :stock => @stock, :quantity => @quantity, :buy_sell_price => @stock.current_price, :log_time => Time.now())
      @user.cash -= @stock_hold
      trade.save
      @user.save
    else
      flash[:notice] = "Trade was not authorized, insufficient funds."
    end
  end

  def sell_stock(stock, quantity)
    @stock = stock
    @quantity = quantity
    @user = current_user

    @total_stocks_owned = 0
    Trade.where({user_id: [@user.id], stock_id: [@stock.id]}).each do |t|
      @total_stocks_owned += t.quantity
    end

    @current_trade_hold = @stock.current_price * @quantity

    if @total_stocks_owned > 0 && @total_stocks_owned >= @quantity
      trade = Trade.new(:user => @user, :stock => @stock, :quantity => -@quantity, :buy_sell_price => @stock.current_price, :log_time => Time.now())
      @user.cash += @current_trade_hold
      @stock.save
      trade.save
      @user.save
    else
      flash[:notice] = "Trade was not authorized."
    end
  end
end
