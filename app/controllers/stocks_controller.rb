class StocksController < ApplicationController

  def index
    @stocks = Stock.all
    render :index
  end

  def show

    if Stock.find_by_id(params[:id])
      @stock = Stock.find_by_id(params[:id])
    else
      raise ActiveRecord::RecordNotFound
    end

    Value.populate_value_check(@stock.symbol)
    @stock.gain_check
    Stock.update_stock(@stock.symbol)

    if current_user
      @portfolio = Portfolio.where({user_id: [current_user.id], stock_id: [params[:id]]})
      if @portfolio != []
        @equity = @portfolio[0]["shares"] * @stock.current_price
      end
    end

    @values = @stock.values
    render :show
  end

  def new
    @stock = Stock.new()
    render :new
  end

  def create
    @stock = Stock.new(stock_params)
    @stock.current_price = @stock.get_current_price(@stock.symbol)
    if @stock.save
      flash[:notice] = "Stock added to database"
      render :new
    else
      render :new
    end
  end

  private

  def stock_params
    params.require(:stock).permit(:symbol, :name, :gain, :current_price, :daily_open, :daily_close, :weekly_open, :weekly_close, :monthly_close, :daily_high, :daily_low, :weekly_high, :weekly_low, :monthly_high, :monthly_low, :yearly_high, :yearly_low, :volume)
  end

end
