class CreateCoreCastings < ActiveRecord::Migration
  def change
    create_table :core_castings do |t|
      t.integer :movie_id, foreign_key: true, nullable: false, index: true
      t.integer :actor_id, foreign_key: true, nullable: false, index: true
      t.string :role
      t.timestamps
    end
  end
end
