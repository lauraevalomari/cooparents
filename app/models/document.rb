class Document < ApplicationRecord
  belongs_to :child
  belongs_to :document_creator, class_name: "User"
end
