# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| read_family        | string  | null: false |
| read_first         | string  | null: false |
| birth              | date    | null: false |



### Association

- has_many :items
- has_many :buys

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product          | string     | null: false                    |
| explanation      | text       | null: false                    |
| category         | integer    | null: false                    |
| status           | integer    | null: false                    |
| delivery_fee     | integer    | null: false                    |
| prefecture       | integer    | null: false                    |
| preparation_days | integer    | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |
 
### Association

- belongs_to :user
- has_one :buy
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :preparation_days

## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer

## buyer テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal       | string     | null: false                    |
| prefecture   | integer    |                                |
| city         | string     |                                |
| address      | string     |                                |
| building     | string     |                                |
| phone        | string     |                                |
| buy          | references | null: false, foreign_key: true |
 
### Association

- belongs_to :buy
- belongs_to_active_hash :prefecture

