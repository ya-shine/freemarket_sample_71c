# README

# このアプリについて
- メルカリ等を模したフリマサイト
- TECH::CAMP 71期夜間・休日スタイルのメンバー2人で作成
- 制作期間： 2020/05/16 ~ 2020/07/31

# サイトURL
- https://www.freemarket71c.com/
- Basic認証
  - ID: admin71c
  - Pass: 0523

# データベース設計

## ER図
[![Image from Gyazo](https://i.gyazo.com/af86a4a18a4047755080b15da9234e5e.png)](https://gyazo.com/af86a4a18a4047755080b15da9234e5e)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, default: ""|
|encrypted_password|string|null: false, default: ""|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|

- add_index :users, :email,                unique: true
- add_index :users, :reset_password_token, unique: true

### Association
- has_one  :credit_card
- has_one  :shipping_address
- has_many :orders
- has_many :items,           dependent: :destroy
- has_many :comments,        dependent: :destroy
- has_many :likes,           dependent: destroy
- has_many :liked_items,     through: :likes, source: :item
- has_many :sns_credentials

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true, null: false|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|buyer_id|references|foreign_key: {to_table: :users}, null: false|
|seller_id|references|foreign_key: {to_table: :users}, null: false|
|item_id|references|foreign_key:true,null:false|
|shipping_address_id|references|foreign_key: true, null: false|
|reciever_last_name|string|
|reciever_first_name|string|
|zipcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|

### Association
- belongs_to :item
- belongs_to :buyer,  class_name: 'User', optional: true, foreign_key: true
- belongs_to :seller, class_name: 'User', optional: true, foreign_key: true

## shipping_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true, null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|zipcode|string|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|
|phone_number|string|

### Association
- belongs_to :user, optional: true

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|brand_id|integer|
|condition_id|integer|null: false|
|delivery_fee_id|integer|null: false|
|shipping_method_id|integer|null: false|
|ship_from_area_id|integer|null: false|
|shipping_day_id|integer|null: false|
|category|references|foreign_key: true, null: false|
|size|references|foreign_key: true|
|user|references|foreign_key: true, null: false|
|item_status|boolean|default: false, null: false|
|likes_count|integer|

### Association
- belongs_to             :user
- belongs_to             :category
- belongs_to             :size , optional: true
- belongs_to_active_hash :brand
- belongs_to_active_hash :ship_from_are
- belongs_to_active_hash :shipping_method
- belongs_to_active_hash :shipping_day
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :condition
- has_many               :images, dependent: :destroy
- has_many               :likes, dependent: :destroy
- has_many               :liked_users, through: :likes, source: :user
- has_many               :comments, dependent: :destroy
- has_one                :order

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|foreign_key: true, null: false|

### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|add_index: true|

### Association
- has_many :items
- has_many :category_sizes
- has_many :sizes, through: :category_sizes
- has_ancestry

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|add_index: true|

### Association
- has_many :items
- has_many :category_sizes
- has_many :categories, through: :category_sizes
- has_ancestry

## category_sizesテーブル

|Column|Type|Options|
|------|----|-------|
|category|references|foreign_key: true|
|size|references|foreign_key: true|

### Association
- belongs_to :category
- belongs_to :size

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true, null: false|
|item|references|foreign_key: true, null: false|

### Association
- belongs_to :user
- belongs_to :item, counter_cache: :likes_count

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user|references|foreign_key: true, null: false|
|item|references|foreign_key: true, null: false|

### Association
- belongs_to :user
- belongs_to :item