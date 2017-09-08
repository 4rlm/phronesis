class Orging < ApplicationRecord
  belongs_to :orgable, polymorphic: true
  belongs_to :org
end
