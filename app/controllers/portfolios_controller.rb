class PortfoliosController < ApplicationController
  def index
    if current_user
      @stocks = Portfolio.stock_summary(current_user)
      @trades = Portfolio.trade_summary(current_user)
      @total_equity = Portfolio.total_equity(current_user)
      @leaderboard = Portfolio.leaderboard
      render :index
    end
  end
end
