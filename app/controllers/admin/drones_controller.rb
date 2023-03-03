class Admin::DronesController < ApplicationController

  def show
    @booking = Booking.new
    @bookings = Drone.find(params[:id]).bookings
    @is_booked = booked?
  end

  def new
    @drone = Drone.new
  end

  def edit
  end

  def create
    @drone = Drone.new(drone_params)
    @drone.user = current_user
    if @drone.save
      redirect_to admin_drones_path, notice: 'Drone was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @drone.update(drone_params)
      redirect_to admin_drone_path(@drone), notice: 'Drone was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @drone.destroy
    redirect_to admin_drones_url, notice: 'Drone was successfully destroyed.'
  end

  private

  def booked?
    @drone.bookings.exists?(['booking_start < ? AND booking_end > ?', Time.now, Time.now])
  end

  def set_drone
    @drone = Drone.find(params[:id])
  end

  def drone_params
    params.require(:drone).permit(:brand, :model, :photo, :description, :price)
  end
end
