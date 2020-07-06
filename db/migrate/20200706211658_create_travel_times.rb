class CreateTravelTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :travel_times do |t|
      t.integer :user_id
      t.string :start_point
      t.string :end_point
      t.string :travel_time_car
      t.string :travel_time_walk

      t.timestamps
    end
  end
end
