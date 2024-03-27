class ChangeCategoryAndDoctypeOnDocuments < ActiveRecord::Migration[7.1]
  def change
    remove_column :documents, :category, :integer
    remove_column :documents, :doctype, :integer
    add_column :documents, :category, :string
    add_column :documents, :doctype, :string
  end
end
