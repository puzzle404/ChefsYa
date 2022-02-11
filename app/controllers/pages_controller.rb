class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @chefs = User.where(chef: true).first(3).reverse

    @chef1 = @chefs[0]
    @chef2 = @chefs[1]
    @chef3 = @chefs[2]

    @reviews1 = Review.where(chef_id: @chef1)
    @reviews2 = Review.where(chef_id: @chef2)
    @reviews3 = Review.where(chef_id: @chef3)


    @rating_average1 = []
    @average1 = 0.0

    @reviews1.each do |review1|
      @rating_average1 << review1.rating
    end

    @average1 = @rating_average1.sum / @rating_average1.count
    @chef1.rating = @average1.to_i
    @chef1.save

    @rating_average2 = []
    @average2 = 0.0

    @reviews2.each do |review2|
      @rating_average2 << review2.rating
    end

    @average2 = @rating_average2.sum / @rating_average2.count
    @chef2.rating = @average2.to_i
    @chef2.save

    @rating_average3 = []
    @average3 = 0.0

    @reviews3.each do |review3|
      @rating_average3 << review3.rating
    end

    @average3 = @rating_average3.sum / @rating_average3.count
    @chef3.rating = @average3.to_i
    @chef3.save

    @dishes = Dish.where(chef_id: @chef1.id)

    @chef1_dish = @dishes[0]
  end

  def chefs
    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @dishes = Dish.where(sql_query, query: "%#{params[:query]}%")
      if @dishes.nil?
        @dishes = Dish.all
        @chefs = User.where(chef: true)
      else
        @dishes.each do |dish|
          @chefs = User.where(id: dish.chef_id)
        end
      end
    else
      @dishes = Dish.all
      @chefs = User.where(chef: true)
    end

      @markers = @chefs.geocoded.map do |chef|
        {
        lat: chef.latitude,
        lng: chef.longitude,
        info_window: render_to_string(partial: "info_window", locals: { chef: chef })
        }
      end
    # Recorro los chef

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
