class DronesController < ApplicationController
  before_action :set_drone, only: [:show, :edit, :update, :destroy]

  def index
    @drones = Drone.all
  end

  def show
    @booking = Booking.new
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
      redirect_to drone_path(@drone)
    else
      render :new
    end
  end

  def update
    if @drone.update(drone_params)
      redirect_to drone_path(@drone)
    else
      render :edit
    end
  end

  def destroy
    @drone.destroy
    redirect_to drones_path
  end

  private

  def set_drone
    @drone = Drone.find(params[:id])
  end

  def drone_params
    params.require(:drone).permit(:name, :description, :price, :photo)
  end
end
