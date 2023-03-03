class DronesController < ApplicationController

  def index
    # @drones = policy_scope(Drone)
    if params[:query].present?
      @drones = Drone.search_by_brand_and_model(params[:query])
    else
      @drones = Drone.all
    end
  end

  def show
    @new_booking = Booking.new
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

  def booked?
    @drone.bookings.exists?(['booking_start < ? AND booking_end > ?', Time.now, Time.now])
  end

  def set_drone
    @drone = Drone.find(params[:id])
  end

  def drone_params
    params.require(:drone).permit(:brand, :model, :price)
  end
end
