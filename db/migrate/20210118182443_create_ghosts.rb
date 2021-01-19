class CreateGhosts < ActiveRecord::Migration[6.1]
  def change
    create_table :ghosts do |t|
      t.string :name
      t.integer :ghostbuster_id
      t.integer :rating
      t.timestamps
    end
  end
end
