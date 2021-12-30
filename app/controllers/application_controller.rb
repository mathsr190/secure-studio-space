class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    case resource
    when Manager
      devise_parameter_sanitizer.permit(:sign_up, keys: [:studio_name, :studio_name_kana])
    when User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:hoge])
    end
  end
end
