class Address < ApplicationRecord
  validates :address, uniqueness: true
  has_many :addressings
  has_many :accounts, through: :addressings, source: :addressable, source_type: :Account
  has_many :contacts, through: :addressings, source: :addressable, source_type: :Contact
end
