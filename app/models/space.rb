class Space < ApplicationRecord
  belongs_to :studio
  has_one_attached :image
  has_many :reservations
  # with_options presence: true do
  #  validates :image
  #  validates :info
  #  validates :space_name
  #  validates :space_name_kana, format: { with: /\A[ぁ-んー－]+\z/ }
  #  with_options numericality: { greater_than: 0, less_than: 2500, message: 'is invalid'} do
  #    validates :length
  #    validates :width
  #    validates :size
  #    validates :height
  #  end
  #  with_options numericality: {only_integer: true, greater_than_or_equal_to: 0, message: 'is invalid'} do
  #    validates :fee_morning
  #    validates :fee_day
  #    validates :fee_night
  #  end
  # end
end
