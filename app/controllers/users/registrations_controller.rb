# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update]

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:fullName, :birthday, :gender, :phone, :wishlist, :blocked, :display_language_type])
  end

  private

  def user_params
    params.require(:user).permit(:fullName, :birthday, :gender, :phone, :wishlist, :blocked, :display_language_type)
  end
end
