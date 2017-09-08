class Crming < ApplicationRecord
  belongs_to :crmable, polymorphic: true
  belongs_to :crm
end
