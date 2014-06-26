class RemoveCapacityFromRestaurant < ActiveRecord::Migration
  def change
  	remove_column :restaurants, :capacity
  end
end
