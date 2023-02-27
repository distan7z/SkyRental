class Booking < ApplicationRecord
  belongs_to :drone
  belongs_to :user
end
