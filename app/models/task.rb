class Task < ApplicationRecord
  belongs_to :child
  belongs_to :task_creator, class_name: "User"
  belongs_to :parent_in_charge, class_name: "User"
end
