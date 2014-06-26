class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.integer :capacity
      t.string :name

      t.timestamps
    end
  end
end
