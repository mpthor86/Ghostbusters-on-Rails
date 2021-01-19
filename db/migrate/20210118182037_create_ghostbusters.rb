class CreateGhostbusters < ActiveRecord::Migration[6.1]
  def change
    create_table :ghostbusters do |t|
      t.string  :name
      t.integer :years_experience
      t.timestamps
    end
  end
end
