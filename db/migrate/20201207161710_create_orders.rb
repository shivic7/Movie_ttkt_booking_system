class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :movie_name
      t.date :movie_date
      t.string :movie_time
      t.integer :fc_seat
      t.integer :sc_seat
      t.integer :tc_seat
      t.integer :tkt_fare

      t.timestamps
    end
  end
end
