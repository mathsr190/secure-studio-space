class UsersController < ApplicationController
  def show
    @user = current_user
    @reservations = @user.reservations.includes(:reservation_detail)
  end
end
