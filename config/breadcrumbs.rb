crumb :root do
  link "フリマ", root_path
end

crumb :mypage do
  link "マイページ", mypage_index_path
  parent :root
end

crumb :payment_method do
  link "支払い方法", credit_cards_path
  parent :mypage
end

crumb :card_register do
  link "クレジットカード情報入力", new_credit_card_path
  parent :payment_method
end

crumb :registered_card do
  link "登録クレジットカード情報"
  parent :mypage
end

crumb :shipping_address do
  link "発送元・お届け先住所変更", edit_shipping_address_path
  parent :mypage
end

crumb :item_all do
  link "商品一覧", items_path
  parent :root
end

crumb :brands do
  link "ブランド一覧", brands_path
  parent :root
end

crumb :brand do |brand|
  brand = Brand.find(params[:id])
  link brand.name
  parent :brands
end

crumb :categories do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :category do |category|
  category = Category.find(params[:id])
  link category.root.name, category_path(category.root)
  parent :categories
end

crumb :category_child do |category_child|
  category_child = Category.find(params[:id])
  if category_child.has_children?
    link category_child.name, category_path(category_child.parent)
    parent :category
  else
    link category_child.parent.name, category_path(category_child.parent)
    parent :category
  end
end

crumb :category_grandchild do |category_grandchild|
  category_grandchild = Category.find(params[:id])
  link category_grandchild.name
  parent :category_child
end