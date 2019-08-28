require 'byebug'
class TradesController < ApplicationController
  binding.pry
  def create
    if params[:commit] == "Buy"
      buy_stock(STOCK, params[:buy_qty].to_i)
      portfolio_update()
    elsif params[:commit] == "Sell"
      sell_stock(STOCK, params[:sell_qty].to_i)
      portfolio_update()
    end
    render :show
  end
end
