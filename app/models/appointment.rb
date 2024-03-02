class Appointment < ApplicationRecord
  belongs_to :child
  has_many :appointment_contacts
  belongs_to :appointment_creator, class_name: "User"
  belongs_to :parent_in_charge, class_name: "User"
end
