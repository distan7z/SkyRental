class Admin::BookingsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @bookings = Booking.all
  end

  #accept?

  #decline?

  private

  def booking_params
    params.require(:booking).permit(:booking_start, :booking_end)
  end

  def authenticate_admin!
    redirect_to root_path, alert: 'You are not authorized to access this page' unless current_user.admin?
  end
end
