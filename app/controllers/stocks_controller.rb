class StocksController < ApplicationController

  def index
    @stocks = Stock.all
    render :index
  end

  def show
    @stock = Stock.find_by_id(params[:id])
    @values = @stock.values
    render :show
  end

end
