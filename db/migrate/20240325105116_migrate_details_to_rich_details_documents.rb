class MigrateDetailsToRichDetailsDocuments < ActiveRecord::Migration[7.1]
  def up
    Document.find_each do |document|
      document.update(rich_details: document.details)
    end
  end

  def down
    Document.find_each do |document|
      document.update(details: document.rich_details)
      document.update(rich_details: nil)
    end
  end
end
