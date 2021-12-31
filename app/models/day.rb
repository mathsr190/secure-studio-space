class Day < ActiveHash::Base
  include ActiveHash::Associations
  has_many :studio_days
  has_many :studios, through: :studio_days
  self.data = [
    { id: 1,  name: '日' },
    { id: 2,  name: '月' },
    { id: 3,  name: '火' },
    { id: 4,  name: '水' },
    { id: 5,  name: '木' },
    { id: 6,  name: '金' },
    { id: 7,  name: '土' },
  ]
end