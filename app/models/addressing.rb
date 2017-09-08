class Addressing < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  belongs_to :address
end
