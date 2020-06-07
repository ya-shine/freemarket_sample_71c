class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  belongs_to :size

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :condition
  end
end
