class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def chefs
    @chefs = User.where(chef: true)
    @dishes = Dish.all
    # @categories = Dish.select(:category).distinct.where(chef_id: @chef)
  end
end
