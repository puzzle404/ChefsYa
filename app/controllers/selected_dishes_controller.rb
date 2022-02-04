class SelectedDishesController < ApplicationController
  def create
    @dish = Dish.find(params[:dish_id])
    # @selected_dish = SelectedDish.new()
  end
end
