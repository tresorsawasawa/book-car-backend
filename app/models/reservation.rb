class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :Car, class_name: 'Car'
end
