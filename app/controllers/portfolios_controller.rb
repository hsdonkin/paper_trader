class PortfoliosController < ApplicationController
  def index

    @stocks = Portfolio.stock_summary(current_user)
    @trades = Portfolio.trade_summary(current_user)
    render :index
  end
end
