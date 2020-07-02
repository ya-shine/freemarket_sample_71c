class Category < ApplicationRecord
  has_many :items
  has_many :category_sizes
  has_many :sizes, through: :category_sizes
  has_ancestry

  def find_items
    if self.root?
      first_id = self.indirects.first.id
      last_id = self.indirects.last.id
      items = Item.where(category_id: first_id..last_id)
    elsif self.has_children? && self.has_parent?
      first_id = self.children.first.id
      last_id = self.children.last.id
      items = Item.where(category_id: first_id..last_id)
    else
      items = self.items
    end
  end
end
