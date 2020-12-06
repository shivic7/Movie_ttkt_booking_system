class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :image_url
      t.integer :is_active

      t.timestamps
    end
  end
end
