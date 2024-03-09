class AddChildIdToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_reference :appointments, :children, column: :child_id
  end
end
