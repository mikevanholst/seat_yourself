class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :party_size
      t.datetime :time_slot
      t.belongs_to :user
      t.belongs_to :restaurant

      t.timestamps
    end
  end
end
