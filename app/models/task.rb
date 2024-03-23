class Task < ApplicationRecord
  belongs_to :child
  belongs_to :task_creator, class_name: "User"
  belongs_to :parent_in_charge, class_name: "User"

  scope :two_first_tasks_for_user, ->(current_user) { where(parent_in_charge_id: current_user.id, status: false).order(deadline: :asc).first(2) }
  scope :all_tasks_for_user, ->(current_user) { where(parent_in_charge_id: current_user.id).order(deadline: :desc) }
end
