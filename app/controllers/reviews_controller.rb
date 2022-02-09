class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new(params[:id])
    @chef = User.find(params[:chef_id])

  end

  def create
    @chef = User.find(params[:chef_id])
    @review = Review.new(reviews_params)
    @review.user_id = current_user.id
    @review.chef_id = @chef.id
    @review.save

    redirect_to reviews_path

  end

  private

  def reviews_params
    params.require(:review).permit(:comment, :rating, :chef_id)
  end
end
