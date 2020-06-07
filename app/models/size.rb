class Size < ApplicationRecord
  has_many :items
  validates :size, presence: true
end
