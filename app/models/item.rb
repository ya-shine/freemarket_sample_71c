class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  belongs_to :size
  has_many :images
  belongs_to_active_hash :ship_from_area
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :delivery_fee

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :condition
  end

  accepts_nested_attributes_for :images, :category,:brand,:size
end
