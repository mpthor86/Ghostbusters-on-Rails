class CreateGhosts < ActiveRecord::Migration[6.1]
  def change
    create_table :ghosts do |t|
      t.string :name
      t.integer :user_id
      t.integer :rating, default: 1
      t.timestamps
    end
  end
end
