class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :first_parent_children, class_name: "Child", foreign_key: "first_parent_id"
  has_many :second_parent_children, class_name: "Child", foreign_key: "second_parent_id"

  has_many :tasks_as_creator, class_name: "Task", foreign_key: :task_creator_id
  has_many :tasks_as_parent_in_charge, class_name: "Task", foreign_key: :parent_in_charge_id

  has_many :appointments_as_creator, class_name: "Appointment", foreign_key: :appointment_creator_id
  has_many :appointments_as_parent_in_charge, class_name: "Appointment", foreign_key: :parent_in_charge_id

  has_many :documents, class_name: "Document", foreign_key: :document_creator_id

  has_many :custody_timeframes, class_name: "CustodyTimeframe", foreign_key: :parent_in_charge_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def children
    Child.where("first_parent_id = ? OR second_parent_id = ?", id, id)
  end

  def parents
    Child.
  end
end
