class DishesController < ApplicationController
  def index
    @chef = User.find(params[:chef_id])
    @dishes = Dish.where(chef_id: @chef)
    @categories = Dish.select(:category).distinct.where(chef_id: @chef)
    @reviews = Review.where(chef_id: @chef)
    @review = Review.new
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if current_user.chef
      @dish.chef_id = current_user.id
      if @dish.save
      redirect_to dish_path(@dish)
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
