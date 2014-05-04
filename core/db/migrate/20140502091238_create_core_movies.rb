class CreateCoreMovies < ActiveRecord::Migration
  def change
    create_table :core_movies do |t|
      t.string :title, null: false
      t.date :production_start, null: false
      t.date :production_finish
      t.date :premiere
      t.text :description
      t.timestamps
    end
  end
end
