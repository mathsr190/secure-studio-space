class ReservationsController < ApplicationController
  def index
    @reservation_form = ReservationForm.new
  end

  def create
    @reservation_form = ReservationForm.new(reservation_form_params)
    if @reservation_form.valid?
      @reservation_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def reservation_form_params
    params.require(:reservation_form).permit(:time_start, :time_end, :price).merge(space_id: params[:space_id], user_id: current_user.id)
  end
end