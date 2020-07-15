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

crumb :category_parent do |category_parent|
  category_parent = Category.find(params[:id])
  link category_parent.name
  parent :categories
end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).