class ChangeColumnNullToChildren < ActiveRecord::Migration[7.1]
  def change
    change_column_null :children, :second_parent_id, true
  end
end
