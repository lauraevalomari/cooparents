class AddAttachmentToDocuments < ActiveRecord::Migration[7.1]
  def change
    add_column :documents, :attachment, :string
  end
end
