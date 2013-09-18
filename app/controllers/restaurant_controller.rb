class RestaurantController < ApplicationController
  



  def new
     @restaurant = Restaurant.new
  end

  def create

    
  end


  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def edit
  end
end
