class ReservationForm
  include ActiveModel::Model
  attr_accessor :token, :space_id, :user_id, :time_start, :time_end, :price

  with_options presence: true do
    validates :time_start
    validates :time_end
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: 'is invalid' }
    validates :space_id
    validates :user_id
    validates :token
  end
  validate :date_before_start
  validate :start_end_order

  def save
    @reservation = Reservation.create(space_id: space_id, user_id: user_id)
    # time_start = DateTime.parse(time_start)
    # time_end = DateTime.parse(time_end)
    ReservationDetail.create(time_start: time_start, time_end: time_end, price: price, reservation_id: @reservation.id)
  end

  def date_before_start
    errors.add(:time_start, "can't be in the past") if time_start.present? && time_start < Time.now
  end

  def start_end_order
    if time_start.present? && time_end.present? && time_start > time_end
      errors.add(:time_end, "can't be earlier than the time start")
    end
  end
end
