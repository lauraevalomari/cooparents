class Changestartendtimetoappointment < ActiveRecord::Migration[7.1]
  def change
    remove_column :appointments, :start_time
    remove_column :appointments, :end_time
    add_column :appointments, :start_time, :datetime
    add_column :appointments, :end_time, :datetime
  end
end
