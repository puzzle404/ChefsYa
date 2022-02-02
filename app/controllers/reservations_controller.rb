class ReservationsController < ApplicationController
  before_action :find_reservation, only: %i[edit update destroy]

  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user
    @reservation.save

    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
  end

  def edit; end

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
    params.require(:reservation).permit(:reservation_date, :observations)
  end
end
