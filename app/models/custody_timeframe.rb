class CustodyTimeframe < ApplicationRecord
  belongs_to :child
  belongs_to :custody_creator, class_name: "User"
  belongs_to :parent_in_charge, class_name: "User"
end
