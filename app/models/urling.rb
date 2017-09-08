class Urling < ApplicationRecord
  belongs_to :urlable, polymorphic: true
  belongs_to :url
end
