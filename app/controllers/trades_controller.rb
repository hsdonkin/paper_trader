class TradesController < ApplicationController

  def create
    puts "In create route"
    stock = Stock.find_by_id(params[:stock_id])
    redirect_to stock_path(stock)
  end
end
