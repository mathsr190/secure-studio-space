class Studio < ApplicationRecord
  belongs_to :manager
  has_many :studio_bdays, dependent: :destroy
  has_many :bdays, through: :studio_bdays
  has_one_attached :image
  with_options presence: true do
    validates :introduction
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :access
    validates :business_hours_start
    validates :business_hours_end
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :image
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
