class ReservationsController < ApplicationController
  before_action :find_reservation, only: %i[edit show update destroy]

  def index
    if current_user.chef == false

      @reservations = Reservation.where(user_id: current_user.id)
    else
      # @reservations = Reservation.where(chef_id: current_user.id)
      @reservations = Reservation.where(chef_id: current_user.id)
      @users = User.where(chef: false)
    end
  end

  def show
    @selected_dishes = @reservation.selected_dishes
    # @chef = User.find(params[:chef_id])
    @dishes = Dish.all
    @chef = User.find(@reservation.chef_id)
  end

  def new
    @chef = User.find(params[:chef_id])
    @dishes = Dish.where(chef_id: @chef)
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    selected_dishes_array = reservation_params[:selected_dishes_id]

    if @reservation.save

      selected_dishes_array.each do |dish_id|
        SelectedDish.create!(dish_id: dish_id, reservation_id: @reservation.id)
      end
      #redirigir al edit de la reservation, tambien agregar los campos de obs, fecha @selected_dishes = @reservation.selected_dishes

      redirect_to edit_reservation_path(@reservation)
    else
      render :new
    end
  end

  def edit
    @selected_dishes = @reservation.selected_dishes
    @dishes = Dish.all

  end

  def update
    @reservation.update(reservation_params)
    redirect_to reservation_path(@reservation)
  end

  def destroy
    @reservation.destroy
    redirect_to rooth_path
  end

  private

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :observations, :chef_id, selected_dishes_id: [])
  end
end
