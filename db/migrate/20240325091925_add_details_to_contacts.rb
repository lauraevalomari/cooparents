class AddDetailsToContacts < ActiveRecord::Migration[7.1]
  def change
    add_column :contacts, :details, :text
  end
end
