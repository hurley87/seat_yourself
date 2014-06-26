class AddDayToResevations < ActiveRecord::Migration
  def change
  	add_column :reservations, :day, :string
  end
end
