class Org < ApplicationRecord
  validates :org, uniqueness: true
  has_many :orgings
  has_many :accounts, through: :orgings, source: :orgable, source_type: :Account
  has_many :contacts, through: :orgings, source: :orgable, source_type: :Contact
end
