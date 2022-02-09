class ReviewsController < ApplicationController
  def index
    @reviews = Review.where(chef_id: params[:chef_id] )
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


    redirect_to chef_dishes_path(@chef)

  end

  private

  def reviews_params
    params.require(:review).permit(:comment, :rating)
  end
end
