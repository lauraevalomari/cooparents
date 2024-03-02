class CreateCustodyTimeframes < ActiveRecord::Migration[7.1]
  def change
    create_table :custody_timeframes do |t|
      t.date :start_date
      t.date :end_date
      t.references :parent_in_charge, foreign_key: { to_table: :users }, null: false
      t.references :custody_creator, foreign_key: { to_table: :users }, null: false
      t.references :child, null: false, foreign_key: true

      t.timestamps
    end
  end
end
