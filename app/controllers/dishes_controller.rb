class DishesController < ApplicationController
  def index
    @chef = User.find(params[:chef_id])
    @dishes = Dish.where(chef_id: @chef)
  end

  def new
    @chef = User.find(params[:chef_id])
    @dish = Dish.new
  end

  def create
    if current_user.id == dish.chef_id
      @chef = User.find(params[:chef_id])
      @dish = Dish.new(dish_params)
      @dish.chef_id = @chef.id
      @dish.save
      redirect_to dish_path(@dish)
    end
  end

  def show
    @dish = Dish.find(params[:id])
  end


  private

  def dish_params
    params.require(:dish).permit(:title, :description, :price, :category)
  end
end
