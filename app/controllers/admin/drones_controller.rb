class Admin::DronesController < ApplicationController
  before_action :set_drone, only: [:show, :edit, :update, :destroy]

  def index
    @drones = policy_scope(Drone)
  end

  def show
    @booking = Booking.new
    @is_booked = booked?
    authorize @drone
  end

  def new
    @drone = Drone.new
    authorize @drone
  end

  def edit
  end

  def create
    @drone = Drone.new(drone_params)
    @drone.user = current_user
    authorize @drone
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
    authorize @drone
  end

  private

  def booked?
    @drone.bookings.exists?(['booking_start < ? AND booking_end > ?', Time.now, Time.now])
  end

  def set_drone
    @drone = Drone.find(params[:id])
  end

  def drone_params
    params.require(:drone).permit(:brand, :model, :photo, :description)
  end
end
