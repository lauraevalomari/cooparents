class Task < ApplicationRecord
  belongs_to :child
  belongs_to :task_creator, class_name: "User"
  belongs_to :parent_in_charge, class_name: "User"
  has_many :documents, as: :documentable
  has_one_attached :attachment
  has_rich_text :rich_details

  CATEGORIES = ['Santé', 'Scolarité', 'Activités', 'Juridique', 'Autres']

  scope :two_first_tasks_for_user, ->(current_user) { where(parent_in_charge_id: current_user.id, status: false).order(deadline: :asc).first(2) }
  scope :all_pending_tasks_for_user, ->(current_user) { where(parent_in_charge_id: current_user.id, status: false).order(deadline: :asc) }
  scope :all_tasks_for_user, ->(current_user) { where(parent_in_charge_id: current_user.id).order(deadline: :desc) }
end
