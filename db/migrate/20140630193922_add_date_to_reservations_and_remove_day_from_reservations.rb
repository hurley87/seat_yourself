class AddDateToReservationsAndRemoveDayFromReservations < ActiveRecord::Migration
  def change
  	remove_column :reservations, :day
  	add_column :reservations, :date, :datetime
  end
end
