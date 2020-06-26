class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    belongs_to :category
    belongs_to :size, optional: true
    belongs_to_active_hash :brand
    belongs_to_active_hash :ship_from_area
    belongs_to_active_hash :shipping_method
    belongs_to_active_hash :shipping_day
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :condition
    has_many :images
  
    validates_associated :images
    # validates :image_ids, presence:true
    validates :name,
      presence: true,
      length: {maximum:40}
    validates :description,
      presence: true,
      length: {maximum:1000}
    validates :price,
      presence: true,
      numericality: {greater_than_or_equal_to:300,less_than:10000000}
    validates :images, presence: true
    validates :category_id, presence: true
    validates :condition_id,presence: true
    validates :size_id, presence:true, if: Proc.new { |item| item.size_id.present? }
    validates :ship_from_area_id,presence: true
    validates :shipping_method_id,presence: true
    validates :shipping_day_id,presence: true
    validates :delivery_fee_id,presence: true
  
    accepts_nested_attributes_for :images, allow_destroy:true
end
