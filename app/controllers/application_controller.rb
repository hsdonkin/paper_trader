class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to '/stocks'
  end

  rescue_from NoStockError do
    flash[:error] = {:msg=>"Sorry! Stock not found.", :class=>"bad-flash"}
    redirect_to '/stocks'
  end

end
