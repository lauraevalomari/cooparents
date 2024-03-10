class ChangeStartTimeToAppointments < ActiveRecord::Migration[7.1]
  def change
    remove_column :appointments, :start_time, :string
    add_column :appointments, :start_time, :time
  end
end
