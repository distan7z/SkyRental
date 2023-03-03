class ReviewsController < ApplicationController
  def create
    @drone = Drone.find(params[:drone_id])
    @review = Review.new(review_params)
    @review.drone = @drone
    if @review.save
      redirect_to drone_path(@drone)
    else
      render "drones/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
