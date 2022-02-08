class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @chefs = User.where(chef: true).last(3).reverse
  end

  def chefs
    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @dishes = Dish.where(sql_query, query: "%#{params[:query]}%")

      @dishes.each do |dish|
        @chefs = User.where(id: dish.chef_id)
      end
    else
        @chefs = User.where(chef: true)
        @dishes = Dish.all
    end
  end
    # @categories = Dish.select(:category).distinct.where(chef_id: @chef)
    # @categories = Dish.select(:category).distinct.where(chef_id: @chef)

  def chefs_dashboard
    @chefs = User.where(chef: true)
    @dishes = Dish.where(chef_id: @chef)

  end
end
