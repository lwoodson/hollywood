class CreateCoreActors < ActiveRecord::Migration
  def change
    create_table :core_actors do |t|
      t.string :first_name, nullable: false
      t.string :last_name, nullable: false
      t.timestamps
    end
  end
end
