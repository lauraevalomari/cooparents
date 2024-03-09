class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :deadline
      t.text :requirements
      t.boolean :status
      t.string :category
      t.text :details
      t.references :child, foreign_key: true, null: false
      t.references :task_creator, foreign_key: { to_table: :users }, null: false
      t.references :parent_in_charge, foreign_key: { to_table: :users }, null: false
      t.timestamps
    end
  end
end
