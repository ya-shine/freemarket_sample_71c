class Like < ApplicationRecord

  belongs_to :user
  belongs_to :item, dependent: :destroy
end
