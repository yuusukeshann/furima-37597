# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |


### Association

- has_many :items
- has_many :purchase_records


## items テーブル

| Column             | Type       | Options        |
| ------------------ | ---------- | -------------- |
| brand_name         | string     | null: false    |
| expository_writing | text       | null: false    |
| category           | string     | null: false    |
| condition          | string     | null: false    |
| price              | integer    | null: false    |

### Association

- belongs_to :user
  has_one :shipping_address
  has_one :purchase_record

## purchase_records テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## shipping_address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| street_number    | string     | null: false                    |
| building_name    | string     | null: false                    |
| telephone_number | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :item