class RestaurantController < ApplicationController
  



  def new
     @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save 
      redirect_to root 
    else
      render :new
    end  
  end


  def index
    # @restaurants = Restaurant.all
  end

  def show
  end

  def edit
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :phone, :price_range, :address, :seats, :category, :neighbourhood)  
  end


end
