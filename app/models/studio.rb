class Studio < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :manager
  belongs_to :prefecture
  has_many :studio_bdays, dependent: :destroy
  has_many :bdays, through: :studio_bdays
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
end
