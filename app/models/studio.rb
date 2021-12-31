class Studio < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :manager
  belongs_to :prefecture
end
