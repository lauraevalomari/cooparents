class ChangeChildIdNullableInDocuments < ActiveRecord::Migration[7.1]
  def change
    change_column_null :documents, :child_id, true
  end
end
