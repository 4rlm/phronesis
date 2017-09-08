class Phoning < ApplicationRecord
  belongs_to :phonable, polymorphic: true
  belongs_to :phone
end
