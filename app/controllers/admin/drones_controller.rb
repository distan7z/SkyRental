class Admin::DronesController < ApplicationController
  before_action :set_drone, only: [:show, :edit, :update, :destroy]

  def index
    @drones = policy_scope(Drone)
  end

  def show
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
    def set_drone
      @drone = Drone.find(params[:id])
    end

    def drone_params
      params.require(:drone).permit(:brand, :model)
    end
end
