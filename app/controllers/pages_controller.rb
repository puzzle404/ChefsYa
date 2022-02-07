class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @chefs = User.where(chef: true).last(3).reverse

  end

  def chefs
    @chefs = User.where(chef: true)
    @dishes = Dish.all
    # @categories = Dish.select(:category).distinct.where(chef_id: @chef)
  end

  def chefs_dashboard
    @chefs = User.where(chef: true)
  end
end
