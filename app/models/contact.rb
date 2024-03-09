class Contact < ApplicationRecord
  has_many :appointment_contacts

  CATEGORIES = ['Santé', 'Scolarité', 'Activités extrascolaires', 'Juridique']
end
