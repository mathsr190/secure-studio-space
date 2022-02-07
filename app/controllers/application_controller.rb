class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action  :store_location

  def after_sign_out_path_for(resource)
    if session[:previous_url] == root_path
      super
    else
      session[:previous_url] || root_path
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:studio_name, :studio_name_kana, :group_name, :group_name_kana, :last_name, :first_name, :last_name_kana,
                                             :first_name_kana, :date_of_birth, :phone_number, :postal_code, :prefecture_id, :city, :address, :building])
  end

  def store_location
    if request.fullpath != new_user_registration_path &&
       request.fullpath != new_user_session_path &&
       # request.fullpath != "/users/password" &&
       request.fullpath !~ Regexp.new('\\A/users/password.*\\z') &&
       !request.xhr?
      session[:previous_url] = request.fullpath
    end
  end
end
