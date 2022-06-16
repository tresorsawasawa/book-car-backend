class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :Car, class_name: 'Car'

  validates :pick_up_day, presence: true
  validates :return_day, presence: true
  validates :pick_up_city, presence: true, length: { maximum: 25 }
  validates :return_city, presence: true, length: { maximum: 25 }
end
