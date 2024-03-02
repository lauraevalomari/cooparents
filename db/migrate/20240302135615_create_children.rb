class CreateChildren < ActiveRecord::Migration[7.1]
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :birth_place
      t.string :school
      t.references :first_parent, foreign_key: { to_table: :users }, null: false
      t.references :second_parent, foreign_key: { to_table: :users }, null: true
      t.timestamps
    end
  end
end
