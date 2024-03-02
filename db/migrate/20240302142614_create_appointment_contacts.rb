class CreateAppointmentContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :appointment_contacts do |t|
      t.references :appointment, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true
      t.timestamps
    end
  end
end
