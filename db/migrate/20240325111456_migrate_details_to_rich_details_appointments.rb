class MigrateDetailsToRichDetailsAppointments < ActiveRecord::Migration[7.1]
  def up
    Appointment.find_each do |appointment|
      appointment.update(rich_details: appointment.details)
    end
  end

  def down
    Appointment.find_each do |appointment|
      appointment.update(details: appointment.rich_details)
      appointment.update(rich_details: nil)
    end
  end
end
