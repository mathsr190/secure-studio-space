class ReservationsController < ApplicationController
  def index
    @reservation_form = ReservationForm.new
  end

  def create
  end
end