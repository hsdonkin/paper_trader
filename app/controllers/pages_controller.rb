require 'byebug'

class PagesController < ApplicationController

  def index
    render :index
  end

  def search
    if params[:search].blank?
      redirect_to(search_path, alert: "Empty field!") and return
    else
      @stock = Stock.populate_stock_table(params[:search])
    end
    redirect_to stock_url(@stock)
  end
end
