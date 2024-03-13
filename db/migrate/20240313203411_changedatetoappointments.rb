class Changedatetoappointments < ActiveRecord::Migration[7.1]
  def change
    change_column :appointments, :date, :datetime
  end
end
