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
   
    if restaurant_full
      redirect_to restaurant_path(@restaurant), notice: "Sorry, your party cannot be seated at that time."
    else
      if @reservation.save
        date_display = @reservation.day.strftime("%A, %b %d")
        time_display = @reservation.meal_time.strftime("%I:%M %p")
        redirect_to restaurant_path(@restaurant), 
          notice: "You have made a reservation at #{@restaurant.name}
          for #{@reservation.party_size} people, on #{date_display} at #{time_display}"
      else
        render :new
      end
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

  def restaurant_full

        seats = @restaurant.seats
        return true if seats < 
        reserved_seats = 0 
        reservation_hour = @reservation.meal_time.hour
        reservation_minutes = @reservation.meal_time.min 
        bookings = @restaurant.reservations.where(:day => @reservation.day)
        return false if bookings.empty?
        # total_seats_reserved = bookings.inject { |sum, b| sum + b.party_size }
        
        # return false if ((seats - @reservation.party_size) > total_seats_reserved)
        bookings.each do |b| 
          match = false
          booking_hour = b.meal_time.hour
          booking_minutes = b.meal_time.min
          match = true if  booking_hour == reservation_hour
          match = true if (booking_hour == (reservation_hour + 1) && booking_minutes < reservation_minutes )    
          match = true if (booking_hour == (reservation_hour - 1) && booking_minutes > reservation_minutes )    
          reserved_seats = reserved_seats + b.party_size if match == true
        end
        vacant_seats = seats - reserved_seats
        if vacant_seats > @reservation.party_size
          return false
        else
          return true 
        end   
  end 

end
