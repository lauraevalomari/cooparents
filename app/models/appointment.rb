class Appointment < ApplicationRecord
  belongs_to :child
  has_many :appointment_contacts
  belongs_to :appointment_creator, class_name: "User"
  belongs_to :parent_in_charge, class_name: "User"
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  CATEGORIES = ['Santé', 'Scolarité', 'Activités extrascolaires', 'Juridique', 'Dépenses', 'Divers', 'Football']
end
