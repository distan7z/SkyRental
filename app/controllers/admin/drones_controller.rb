class Admin::DronesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_drone, only: [:show, :edit, :update, :destroy]

  def index
    @drones = Drone.all
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

    respond_to do |format|
      if @drone.save
        format.html { redirect_to admin_drone_path(@drone), notice: 'Drone was successfully created.' }
        format.json { render :show, status: :created, location: @drone }
      else
        format.html { render :new }
        format.json { render json: @drone.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @drone.update(drone_params)
        format.html { redirect_to admin_drone_path(@drone), notice: 'Drone was successfully updated.' }
        format.json { render :show, status: :ok, location: @drone }
      else
        format.html { render :edit }
        format.json { render json: @drone.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @drone.destroy
    respond_to do |format|
      format.html { redirect_to admin_drones_url, notice: 'Drone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_drone
      @drone = Drone.find(params[:id])
    end

    def drone_params
      params.require(:drone).permit(:name, :description, :price, :photo)
    end

    def authenticate_admin!
      redirect_to root_path, alert: 'You are not authorized to access this page' unless current_user.admin?
    end
end
