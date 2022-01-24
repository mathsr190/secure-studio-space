class Reservation < ApplicationRecord
  belongs_to :space
  belongs_to :user
  has_one :reservation_detail
end
