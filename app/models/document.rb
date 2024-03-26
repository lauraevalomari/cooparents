class Document < ApplicationRecord
  belongs_to :documentable, polymorphic: true, optional: true
  has_one_attached :attachment
  belongs_to :child, optional: true
  belongs_to :document_creator, class_name: "User"
  CATEGORIES = ['Santé', 'Scolarité', 'Activités', 'Juridique', 'Autres']
  DOCS = ["Etat civil", "Bulletin scolaire", "Liste de pièces", "Ordonnance", "Résultats médicaux", "Jugement", "Photo", "Autre"]
  has_rich_text :rich_details

  before_validation :set_title_if_not_given

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

  private

  def set_title_if_not_given
    if title.blank? && attachment.attached?
      self.title = attachment.filename.to_s
    end
  end

end
