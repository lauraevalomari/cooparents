class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.date :added_date
      t.string :category
      t.text :details
      t.references :child, null: false, foreign_key: true
      t.references :document_creator, foreign_key: { to_table: :users }, null: false
      t.timestamps
    end
  end
end
