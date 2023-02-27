class Admin::BookingsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @bookings = Booking.all
  end

  private

  def authenticate_admin!
    redirect_to root_path, alert: 'You are not authorized to access this page' unless current_user.admin?
  end
end
