class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:studio_name, :studio_name_kana, :group_name, :group_name_kana, :last_name, :first_name, :last_name_kana,
                                             :first_name_kana, :date_of_birth, :phone_number, :postal_code, :prefecture_id, :city, :address, :building])
  end
end
