class Bday < ApplicationRecord
  has_many :studio_bdays
  has_many :studios, through: :studio_bdays
end
