class Appointment < ApplicationRecord
  belongs_to :child
  belongs_to :contact, optional: true
  accepts_nested_attributes_for :contact
  has_many :documents, as: :documentable
  has_one_attached :attachment
  belongs_to :appointment_creator, class_name: "User"
  belongs_to :parent_in_charge, class_name: "User"
  has_rich_text :rich_details
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  CATEGORIES = ['Santé', 'Scolarité', 'Activités', 'Juridique', 'Autres']

  scope :daily_appointments, ->(current_user) { where('start_time >= ? AND end_time <= ? AND parent_in_charge_id = ?', Date.today.beginning_of_day, Date.today.end_of_day, current_user)}

  scope :five_appointments_to_come, ->(current_user) { where(parent_in_charge_id: current_user.id).order(start_time: :asc).first(5) }

  validates :title, presence: true
  validates :date, presence: true
  validates :start_time, :end_time, presence: true

  validates :start_time, uniqueness: { scope: :parent_in_charge && :date, message: "Ce parent est déjà occupé. Choisissez un autre créneau" }

  def set_category_color
    if category == "Scolarité"
      "violet"
    elsif category == "Santé"
      "turquoise"
    elsif category == "Activités"
      "pink"
    elsif category == "Juridique"
      "yellow"
    elsif category == "Autres"
      "green"
    end
  end
end
