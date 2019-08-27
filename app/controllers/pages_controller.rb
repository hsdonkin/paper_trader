class PagesController < ApplicationController
  def index
    render :index
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = Stock.all.where("lower(name) LIKE :search", search: @parameter)
    end

    render :search
  end
end
