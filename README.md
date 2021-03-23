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

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product             | string     | null: false                    |
| explanation         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| delivery_fee_id     | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| preparation_days_id | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
 
### Association

- belongs_to :user
- has_one :buy

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

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal        | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone         | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |
 
### Association

- belongs_to :buy


