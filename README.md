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
|last_name|string|null:false|
|first_name|string|null:false|
|last_name_kana|string|null:false|
|first_name_kana|string|null:false|
|birth_day|date|null:false|

- has_one :credit_card
- has_one :profile
- has_one :shipping_address
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
|zipcode|string|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|address|string|null:false|
|building|string|

- belongs_to :user

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|buyer_id|references|foreign_key:true,null:false|
|seller_id|references|foreign_key:true,null:false|
|shipping_address_id|references|foreign_key:true,null:false|
|item_id|references|foreign_key:true,null:false|
|firstname_deliver_at|string|null:false|
|familyname_deliver_at|string|null:false|
|firstname_kana_deliver_at|string|null:false|
|familyname_kana_deliver_at|string|null:false|
|user_points|integer|
|payment_method|string|null:false|

- has_one :evaluation
- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address

## shipping_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key:true,null:false|
|zipcode|string|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|address|string|null:false|
|building|string|

- has_one :order
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false, add_index:true|
|user_id|references|foreigh_key:true, null:false|
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
- belongs_to :size 
- has_one :order
- has_many :likes
- has_many :comments
- has_many :images

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|foreign_key:true,null:false|

- belongs_to :item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

- has_many :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|add_index: true|

- has_many :items

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