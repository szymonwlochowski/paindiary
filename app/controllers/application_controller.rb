class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:password, :password_confirmation, :current_password, :city, :sex)
    }
  end

end
