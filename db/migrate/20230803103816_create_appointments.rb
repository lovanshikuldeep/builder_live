class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.date :date
      t.string :slote_time
      t.string :pickup_location
      t.string :full_name
      t.string :phone_number
      t.boolean :cab_service, :default => false
      t.belongs_to :user

      t.timestamps
    end
  end
end
