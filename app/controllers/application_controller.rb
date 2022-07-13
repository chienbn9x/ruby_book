class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  # cart
  before_action :check_session
  helper_method :current_order
  # i18n
  before_action :set_locale

  def current_order
    if !session[:order_id].nil?
      @order = Order.find(session[:order_id])
    else
      @order = Order.new
    end
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:fullName])
      devise_parameter_sanitizer.permit(:account_update, keys: [:fullName, :birthday, :gender, :phone, :wishlist, :blocked, :display_language_type])
    end

    def check_session
      if !session[:order_id].nil? && Order.all.count == 0
        session.delete(:order_id)
      end
    end

  private
  def set_locale
    I18n.locale = I18n.default_locale
    I18n.locale = current_user.locale if user_signed_in?
  end

end
