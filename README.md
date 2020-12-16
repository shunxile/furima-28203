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

# テーブル設計

## users テーブル

| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- | 
| last_name          | string | null: false               | 
| first_name         | string | null: false               | 
| last_name_kana     | string | null: false               | 
| first_name_kana    | string | null: false               | 
| nickname           | string | null: false               | 
| email              | string | null: false, unique: true | 
| encrypted_password | string | null: false               | 
| date_birth         | date   | null: false               | 

### Association
- has_many :items
- has_many :purchase_forms

## itemsテーブル

| Column             | Type       | Options     | 
| ------------------ | ---------- | ----------- | 
| name               | string     | null: false | 
| content            | text       | null: false | 
| value              | integer    | null: false | 
| state_id           | integer    | null: false | 
| shipping_charge_id | integer    | null: false | 
| ship_area_id       | integer    | null: false | 
| ship_day_id        | integer    | null: false | 
| category_id        | integer    | null: false |
| user               | references | null: false |

### Association
- has_one :purchase_form
- belongs_to :user

## purchase_historyテーブル

| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ | 
| user   | references | null: false, foreign_key: true | 
| item   | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressテーブル

| Column        | Type       | Options                    | 
| ------------- | ---------- | -------------------------- | 
| postal_code   | string     | null: false                | 
| state_id      | integer    | null: false                | 
| city          | string     | null: false                | 
| street_number | string     | null: false                | 
| building_name | string     |                            |
| phone_number  | string     | null: false, precision: 11 | 
| purchase_form | references | null: false                |

### Association
- belongs_to : purchase_form