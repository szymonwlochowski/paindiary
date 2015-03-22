class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  layout :set_layout

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  helper_method :forem_user

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:password, :password_confirmation, :current_password, :layout_name, :custom_layout, :city, :sex)
    }
  end

  def forem_user
    current_user
  end

  private

    def set_layout
      user_signed_in? ? current_user.layout_name : 'application'
    end


end
