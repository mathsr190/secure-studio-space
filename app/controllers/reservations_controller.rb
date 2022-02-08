class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @reservation_form = ReservationForm.new
  end

  def create
    @reservation_form = ReservationForm.new(reservation_form_params)
    if @reservation_form.valid?
      pay_jp
      @reservation_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def reservation_form_params
    params.require(:reservation_form).permit(:price).merge(space_id: params[:space_id], user_id: current_user.id, token: params[:token],
                                                           time_start: Time.new(
                                                             params[:reservation_form]['time_start(1i)'].to_i,
                                                             params[:reservation_form]['time_start(2i)'].to_i,
                                                             params[:reservation_form]['time_start(3i)'].to_i,
                                                             params[:reservation_form]['time_start(4i)'].to_i, 0, 0
                                                           ),
                                                           time_end: Time.new(
                                                             params[:reservation_form]['time_end(1i)'].to_i,
                                                             params[:reservation_form]['time_end(2i)'].to_i,
                                                             params[:reservation_form]['time_end(3i)'].to_i,
                                                             params[:reservation_form]['time_end(4i)'].to_i, 0, 0
                                                           ))
  end

  def pay_jp
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @reservation_form.price,
      card: reservation_form_params[:token],
      currency: 'jpy'
    )
  end
end
