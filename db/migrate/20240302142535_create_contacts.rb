class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone_number
      t.string :email
      t.string :category

      t.timestamps
    end
  end
end
