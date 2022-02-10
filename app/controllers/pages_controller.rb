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


       @markers = @chefs.geocoded.map do |chef|
        {
        lat: chef.latitude,
        lng: chef.longitude,
        info_window: render_to_string(partial: "info_window", locals: { chef: chef })
        }
      end

    else
      @dishes = Dish.all
      @chefs = User.where(chef: true)

      @markers = @chefs.geocoded.map do |chef|
        {
        lat: chef.latitude,
        lng: chef.longitude,
        info_window: render_to_string(partial: "info_window", locals: { chef: chef })
        }
      end
    end
  end
    # @categories = Dish.select(:category).distinct.where(chef_id: @chef)
    # @categories = Dish.select(:category).distinct.where(chef_id: @chef)

  def chefs_dashboard
    @chefs = User.where(chef: true)
    @reviews = Review.where(chef_id: current_user.id)
  end

  def mis_platos
    @dishes = Dish.where(chef_id: current_user.id)
  end

  def mis_reviews
    @reviews = Review.where(chef_id: current_user.id)
  end
end
