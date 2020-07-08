class Order < ApplicationRecord
  belongs_to :item
  belongs_to :seller, class_name: 'User', optional: true, foreign_key: true
  belongs_to :buyer, class_name: 'User', optional: true, foreign_key: true

  validates :receiver_last_name, presence: true
  validates :receiver_first_name, presence: true
  validates :zipcode, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
end
