class Crm < ApplicationRecord
  validates :crm, uniqueness: true
  has_many :crmings
  has_many :accounts, through: :crmings, source: :crmable, source_type: :Account
  has_many :contacts, through: :crmings, source: :crmable, source_type: :Contact
end
