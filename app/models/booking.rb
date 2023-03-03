class Booking < ApplicationRecord
  belongs_to :drone
  belongs_to :user

  def start_time
    booking_start
  end
end
