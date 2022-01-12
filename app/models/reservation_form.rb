class ReservationForm
  include ActiveModel::Model
  attr_accessor :space_id, :user_id, :time_start, :time_end, :price

  with_options presence: true do
    validates :time_start
    validates :time_end
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: 'is invalid' }
    validates :space_id
    validates :user_id
  end


  def save
    @reservation = Reservation.create(space_id: space_id, user_id: user_id)
    ReservationDetail.create(time_start: time_start, time_end: time_end, price: price, reservation_id: @reservation.id)
  end
end