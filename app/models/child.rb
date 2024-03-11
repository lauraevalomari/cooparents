class Child < ApplicationRecord
  belongs_to :first_parent, class_name: "User"
  belongs_to :second_parent, class_name: "User", optional: true
  has_many :tasks
  has_many :appointments
  has_many :documents
  has_many :custody_timeframes

  def parents
    [first_parent, second_parent]
  end

  def appointments
    Appointment.where("child_id = ?", id)
  end

  def tasks
    Task.where("child_id = ?", id)
  end
end
