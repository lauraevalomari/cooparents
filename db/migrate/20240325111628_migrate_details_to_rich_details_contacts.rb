class MigrateDetailsToRichDetailsContacts < ActiveRecord::Migration[7.1]
  def up
    Contact.find_each do |contact|
      contact.update(rich_details: contact.details)
    end
  end

  def down
    Contact.find_each do |contact|
      contact.update(details: contact.rich_details)
      contact.update(rich_details: nil)
    end
  end
end
