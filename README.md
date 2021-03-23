# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| product      | string     | null: false                    |
| explanation  | text       | null: false                    |
| category     | string     | null: false                    |
| status       | string     | null: false                    |
| delivery_fee | string     | null: false                    |
| area         | string     | null: false                    |
| days         | string     | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
 
### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| buy    | boolean    | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer

## buyer テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| card_num     | integer    | null: false                    |
| expiration   | integer    | null: false                    |
| cvc          | integer    | null: false                    |
| postal       | string     | null: false                    |
| prefecture   | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     | null: false                    |
| phone        | integer    | null: false                    |
| buy          | references | null: false, foreign_key: true |
 
### Association

- belongs_to :buy

