class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :ghostbuster_id
      t.datetime  :appointment_time
      t.string :appointment_address
      t.timestamps
    end
  end
end
