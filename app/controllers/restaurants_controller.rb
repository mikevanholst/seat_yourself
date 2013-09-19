class RestaurantsController < ApplicationController

  def new
     @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save 
      redirect_to @restaurant, notice: "Restaurant successfully added." 
    else
      render :new
    end  
  end


  def index
    @restaurants = Restaurant.all
  end

  def show
   load_restaurant
  end

  def edit
    load_restaurant
  end

  def update
    load_restaurant
    if @restaurant.update_attributes(restaurant_params)
      redirect_to @restaurant, notice: "Successfully updated!"
    else
      render :new
    end  
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :phone, :price_range, :address, :seats, :category, :neighbourhood)  
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:id])    
  end

end
