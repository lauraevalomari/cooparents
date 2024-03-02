class Child < ApplicationRecord
  belongs_to :first_parent, class_name: "User"
  belongs_to :second_parent, class_name: "User", optional: true
  has_many :tasks
  has_many :appointments
  has_many :documents
  has_many :custody_timeframes
end
