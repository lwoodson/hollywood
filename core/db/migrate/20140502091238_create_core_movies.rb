class CreateCoreMovies < ActiveRecord::Migration
  def change
    create_table :core_movies do |t|
      t.string :title, null: false
      t.datetime :production_start, null: false
      t.datetime :production_finish
      t.datetime :premiere
      t.text :description
      t.timestamps
    end
  end
end
