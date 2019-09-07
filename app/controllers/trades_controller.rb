class TradesController < ApplicationController
  def create
    stock = Stock.find_by_id(params[:stock_id].to_i)
    # conditional to prevent buying / selling that you aren't able to do
    if params[:commit] == "Buy"
      if current_user.buy_stock(current_user, stock, params[:buy_qty].to_i) == false
        flash[:notice] = {:msg => "Trade not authorized, insufficent funds.", :class=> "trade-fail-flash"}
      else
        flash[:notice] = {:msg => "Trade successful!", :class=> "trade-success-flash"}
        current_user.portfolio_update(current_user)
      end
      redirect_to stock_path(stock)

    elsif params[:commit] == "Sell"
      if current_user.sell_stock(current_user, stock, params[:sell_qty].to_i) == false
        flash[:notice] = {:msg => "Trade not authorized, insufficient stock.", :class=> "trade-fail-flash"}
      else
        flash[:notice] = {:msg => "Trade successful!", :class=> "trade-success-flash"}
        current_user.portfolio_update(current_user)
      end
      redirect_to stock_path(stock)
    end


  end
end
