class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(reservation_params)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:party_size, :time_slot)
  end

end
