class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.string :title
      t.date :date
      t.string :start_time
      t.string :time
      t.time :end_time
      t.string :address
      t.float :location_latitude
      t.float :location_longitude
      t.string :category
      t.boolean :child_presence_mandatory
      t.text :details
      t.references :appointment_creator, foreign_key: { to_table: :users }, null: false
      t.references :parent_in_charge, foreign_key: { to_table: :users }, null: false
      t.references :user, null: false, foreign_key: true
      t.references :child, null: false, foreign_key: true

      t.timestamps
    end
  end
end
