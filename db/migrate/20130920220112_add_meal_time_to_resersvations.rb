class AddMealTimeToResersvations < ActiveRecord::Migration
  def change
    add_column :reservations, :meal_time, :time
    add_column :reservations, :day, :date
  end
end
