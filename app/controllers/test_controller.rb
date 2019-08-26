class TestController < ApplicationController

  def index
    @temp = "hello"
    render :index
  end

end
