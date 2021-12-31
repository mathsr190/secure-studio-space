class Studio < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :manager
  belongs_to :prefecture
  has_many :studio_days
  has_many :days, through: :studio_days
end
