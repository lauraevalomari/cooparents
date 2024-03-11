class Appointment < ApplicationRecord
  belongs_to :child
  has_many :appointment_contacts
  belongs_to :appointment_creator, class_name: "User"
  belongs_to :parent_in_charge, class_name: "User"
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  CATEGORIES = ['Santé', 'Scolarité', 'Activités', 'Juridique', 'Autres']

  validates :title, presence: true
  validates :date, presence: true
  validates :start_time, :end_time, presence: true

  validates :start_time, uniqueness: { scope: :parent_in_charge && :date, message: "Ce parent est déjà occupé. Choisissez un autre créneau" }
end
