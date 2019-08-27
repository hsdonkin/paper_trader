class PagesController < ApplicationController
  def index
    render :index
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @stock = Stock.populate_stock_table(params[:search])
    end

     render :search
  end
end
