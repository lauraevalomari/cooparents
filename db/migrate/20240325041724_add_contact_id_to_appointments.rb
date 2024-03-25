class AddContactIdToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_reference :appointments, :contact, null: true, foreign_key: true
  end
end
