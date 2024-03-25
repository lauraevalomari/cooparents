class AddPolymorphicReferenceToDocuments < ActiveRecord::Migration[7.1]
  def change
    add_reference :documents, :documentable, polymorphic: true, null: true
  end
end
