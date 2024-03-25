class AddAttachmentToContacts < ActiveRecord::Migration[7.1]
  def change
    add_column :contacts, :attachment, :string
  end
end
