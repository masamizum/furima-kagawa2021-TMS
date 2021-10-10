
# テーブル設計

## Users テーブル

| Column             | Type   |       Options             |
| ------------------ | ------ | --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :orders
- belongs_to :user


## Items テーブル

| Column                   | Type      | Options            |
| ------------------------ | --------- | ------------------ |
| item_name                | string    | null: false        |
| item_info                | text      | null: false        |
| category_id              | string    | null: false        |
| sales_status_id          | string    | null: false        |
| shipping_fee_status_id   | string    | null: false        |
| prefecture_id            | string    | null: false        |
| scheduled_delivery_id    | string    | null: false        |
| price                    | integer   | null: false        |
| user                     | reference | foreign_key: true  |

### Association

- belongs_to :user
- has_one    :order


## Orders テーブル

| Column             | Type      | Options           |
| ------------------ | --------- | ------------------|
| user               | reference | foreign_key: true |
| item               | reference | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :destination


## Destinations テーブル

| Column             | Type      | Options           |
| ------------------ | --------- | ------------------|
| postal_code        | string    | null: false       |
| prefecture_id      | string    | null: false       |
| city               | string    | null: false       |
| addresses          | string    | null: false       |
| building           | string    |                   |
| phone_number       | string    | null: false       |
| order              | reference | foreign_key: true |


### Association

- belongs_to :order
#