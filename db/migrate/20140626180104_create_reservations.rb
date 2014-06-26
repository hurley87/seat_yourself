class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :slot
      t.datetime :day

      t.timestamps
    end
  end
end
