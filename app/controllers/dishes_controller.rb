class DishesController < ApplicationController
  def index
    @chef = User.find(params[:id])
    @dishes = Dish.where(chef_id: @chef)
  end

  def new
    @chef = User.find(params[:id])
    @dish = Dish.new
  end

  def create
    @chef = User.find(params[:id])
    @dish = Dish.new(dish_params)
    @dish.chef_id = @chef.id
    @dish.save
    redirect_to chef_show_dish_path(@dish)
  end

  def show
    @chef = User.find(params[:user_id])
    @dish = Dish.find(params[:id])
  end

  private

  def dish_params
    params.require(:dish).permit(:title, :description, :price, :category)
  end
end
