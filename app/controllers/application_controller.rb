class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      @order = Order.find(session[:order_id])
    else
      @order = Order.new
    end
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:fullName, :email, :password) }
    end

end
