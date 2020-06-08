class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  belongs_to :size
  has_many :images

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :condition
  end

  accepts_nested_attributes_for :images, :category,:brand,:size
end
