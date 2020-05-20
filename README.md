# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# database設計

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null:false, unique:true|
|password|string|null:false|

- has_one :credit_card
- has_one :profile
- has_many :items
- has_many :orders
- has_many :comments
- has_many :likes
- has_many :evaluations


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key:true, null:false|
|card_number|integer|null:false|
|expiration_month|integer|null:false|
|expiration_month|integer|null:false|
|security_number|integer|null:false|

- belongs_to :user

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key:true, null:false|
|name|string|null:false|
|profile_text|text|
|birthday|integer|
|phone_number|integer|unique:true|
|zipcode|integer|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|address|string|null:false|
|building|string|

- belongs_to :user
- has_many :orders

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|buyer_id|references|foreign_key:true,null:false|
|seller_id|references|foreign_key:true,null:false|
|item_id|references|foreign_key:true,null:false|
|firstname_deliver_at|string|null:false|
|familyname_deliver_at|string|null:false|
|firstname_kana_deliver_at|string|null:false|
|familyname_kana_deliver_at|string|null:false|
|user_points|integer|
|zipcode|references|null:false|
|prefecture|references|null:false|
|city|references|null:false|
|address|references|null:false|
|building|references|
|payment_method|string|null:false|

- has_one :evaluation
- belongs_to :user
- belongs_to :item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false, add_index:true|
|category_id|references|foreign_key:true, null:false|
|brand_id|references|foreign_key:true|
|discription|text|null:false|
|price|integer|null:false|
|condition|integer|null:false|
|size_id|references|foreign_key:true|
|delivery_fee|string|null:false|
|ship_from_area|string|null:false|
|shipping_method|string|null:false|
|shipping_days|string|null:false|
|selling_status|boolean|null:false|

- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_one :order
- has_one :size 
- has_many :likes
- has_many :comments

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|category_id|references|foreign_key:true,null:false|

- has_many :items
- has_many :categories, through: :brands_categories
- has_many :brands_categories

## brands_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|references|foreign_key:true,null:false|
|brand_id|references|foreign_key:true,null:false|

- belongs_to :brand
- belongs_to :category

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|first_category|string|null:false|
|second_category|string|null:false|
|third_category|string|null:false|
|brand_id|references|foreign_key,null:false|

- has_many :items
- has_many :brands, through: :brands_categories
- has_many :brands_categories

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null:false|

- has_many :items

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key:true, null:false|
|item_id|references|foreign_key:true, null:false|

- belongs_to :user
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null:false|
|user_id|references|foreign_key:true, null:false|
|item_id|references|foreign_key:true, null:false|

- belongs_to :user
- belongs_to :item

## evaluationテーブル
|Column|Type|Options|
|------|----|-------|
|evaluation|integer|null:false|
|user_id|references|foreign_key:true, null:false|
|order_id|references|foreign_key:true, null:false|

- belongs_to :user
- belongs_to :order