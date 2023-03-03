class Admin::BookingsController < ApplicationController

  def index
    @user_drones = Drone.where(user_id: current_user)
    @bookings = @user_drones.flat_map {|user_drone| Booking.where(drone_id: user_drone.id) }
  end

  #accept?

  #decline?

  private

  def booking_params
    params.require(:booking).permit(:booking_start, :booking_end)
  end
end
