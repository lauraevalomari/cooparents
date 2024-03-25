class Contact < ApplicationRecord
  has_many :appointments
  has_many :documents, as: :documentable
  has_rich_text :rich_details
  has_one_attached :attachment


  CATEGORIES = ['Santé', 'Scolarité', 'Activités', 'Juridique', 'Autres']

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

  def contacts
    @all_contacts = []
    @all_contacts << Contact.all
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
