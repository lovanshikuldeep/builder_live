class AddColumnToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :current_time, :time
  end
end
