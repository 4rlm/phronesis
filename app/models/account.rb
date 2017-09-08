class Account < ApplicationRecord
  has_many :phonings, as: :phonable
  has_many :phones, through: :phonings

  has_many :urlings, as: :urlable
  has_many :urls, through: :urlings

  has_many :orgings, as: :orgable
  has_many :orgs, through: :orgings

  has_many :addressings, as: :addressable
  has_many :addresses, through: :addressings

  has_many :crmings, as: :crmable
  has_many :crms, through: :crmings
end
