class ReservationsController < ApplicationController
  

 before_action :remember_restaurant 

  def new
    if Rails.env.development?
      @reservation = FactoryGirl.build(:reservation)
    else
    @reservation = Reservation.new
    end
  end



  def create
    @user = User.find(1) 
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user_id = @user.id  #whith sorcery add current_user.id
    # @reservation = Reservation.new(reservation_params)


    # Reservation.find(15).meal_time.hour

    # Reservation.where(:restaurant_id => 1).sum(:party_size)
    #Reservation.where(:restaurant_id => 1).where(day: "2013-09-19").sum(:party_size)

    # @bookings = @restaurant.reservations.where(:day => @reservation.day) 
    # puts @bookings.inspect
    # reserved = @bookings.select {|b| (b.meal_time - @reservation.meal_time).abs <= 1.hour}
  
    # conflicts = reserved.inject { |memo, r| memo = memo + r.party_size}
    # if @restaurant.seats - conflicts > @restaurant.party_size
    if @reservation.save
      date_display = @reservation.day.strftime("%A, %b %d")
      time_display = @reservation.meal_time.strftime("%I:%M %p")
        redirect_to restaurant_path(@restaurant), 
        notice: "You have made a reservation at #{@restaurant.name}
       for #{@reservation.party_size} people, on #{date_display} at #{time_display}"
      # else
      #   render new, notice: "Sorry, your party cannot be seated at that time."
      # end
    else
      render new
    end      
  end



  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(reservation_params)
  end

  private

  def remember_restaurant
     @restaurant = Restaurant.find(params[:restaurant_id])
  end


  def reservation_params
    params.require(:reservation).permit(:party_size, :time_slot, :date, :day, :meal_time)
  end

end
