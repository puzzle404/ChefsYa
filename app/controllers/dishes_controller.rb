class DishesController < ApplicationController
  def index
    @chef = User.find(params[:chef_id])
    @dishes = Dish.where(chef_id: @chef)
    @categories = Dish.select(:category).distinct.where(chef_id: @chef)
    @reviews = Review.where(chef_id: @chef)
    @review = Review.new

    @rating_average = []
    @average = 0.0

    @reviews.each do |review|
      @rating_average << review.rating
    end

    @average = @rating_average.sum / @rating_average.count
    @chef.rating = @average.to_i
    @chef.save

    @dish_photos = []
    @dishes.each do |dish|
      dish.photos.each do |photo|
        @dish_photos <<  photo.key
      end
    end
    @dish_photo1 = @dish_photos[0]
    @dish_photo2 = @dish_photos[1]
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if current_user.chef
      @dish.chef_id = current_user.id
      if @dish.save
      redirect_to mis_platos_path
      else
      render :new
      end
    end
  end

  def show
    @dish = Dish.find(params[:id])

  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def update
    @dish = Dish.find(params[:id])
    @dish.update(dish_params)
    redirect_to dish_path(@dish)
  end

  def destroy
    @dish = Dish.find(params[:id])
    @dish.delete
    redirect_to mis_platos_path
  end

  private

  def dish_params
    params.require(:dish).permit(:title, :description, :price, :category, photos: [])
  end
end
