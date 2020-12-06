class CreateMovieDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_details do |t|
      t.integer :movie_id
      t.date :movie_date
      t.string :movie_time
      t.integer :first_class_seat
      t.integer :second_class_seat
      t.integer :third_class_seat

      t.timestamps
    end
  end
end
