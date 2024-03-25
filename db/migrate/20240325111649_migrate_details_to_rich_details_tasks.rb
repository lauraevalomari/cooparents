class MigrateDetailsToRichDetailsTasks < ActiveRecord::Migration[7.1]
  def up
    Task.find_each do |task|
      task.update(rich_details: task.details)
    end
  end

  def down
    Task.find_each do |task|
      task.update(details: task.rich_details)
      task.update(rich_details: nil)
    end
  end
end
