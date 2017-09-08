class Url < ApplicationRecord
  validates :url, uniqueness: true
  has_many :urlings
  has_many :accounts, through: :urlings, source: :urlable, source_type: :Account
  has_many :contacts, through: :urlings, source: :urlable, source_type: :Contact
end
