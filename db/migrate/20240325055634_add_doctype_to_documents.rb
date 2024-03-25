class AddDoctypeToDocuments < ActiveRecord::Migration[7.1]
  def change
    add_column :documents, :doctype, :integer
    remove_column :documents, :category, :string
    add_column :documents, :category, :integer
  end
end
