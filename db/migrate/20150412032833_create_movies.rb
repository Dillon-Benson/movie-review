class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.date :release_date
      t.string :rating
      t.string :genre
      t.integer :stars
      t.integer :votes

      t.timestamps null: false
    end
  end
end
