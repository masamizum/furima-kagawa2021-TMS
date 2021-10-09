
# テーブル設計

## Users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |

### Association

- has_many :items
- has_many :orders
- has_one  :plofile


## Plofiles テーブル

| Column             | Type      | Options           |
| ------------------ | --------- | ----------------- |
| last_name          | string    | null: false       |
| first_name         | string    | null: false       |
| last_name_kana     | string    | null: false       |
| first_name_kana    | string    | null: false       |
| birth_date         | datetime  | null: false       |
| user_id            | reference | foreign_key: true |

### Association

- belongs_to :user


## Items テーブル

| Column                   | Type      | Options            |
| ------------------------ | --------- | ------------------ |
| item_image               | image     | ActiveStorageで実装 |
| item_name                | string    | null: false        |
| item_info                | text      | null: false        |
| item_category            | string    | null: false        |
| item_sales_status        | string    | null: false        |
| item_shipping_fee_status | string    | null: false        |
| item_prefecture          | string    | null: false        |
| item_scheduled_delivery  | string    | null: false        |
| item_price               | integer   | null: false        |
| user_id                  | reference | foreign_key: true  |

### Association

- belongs_to :user
- has_one    :order


## Orders テーブル

| Column             | Type      | Options           |
| ------------------ | --------- | ------------------|
| user_id            | reference | foreign_key: true |
| item_id            | reference | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :destination


## Destinations テーブル

| Column             | Type      | Options           |
| ------------------ | --------- | ------------------|
| postal_code        | string    | null: false       |
| prefecture         | string    | null: false       |
| city               | string    | null: false       |
| addresses          | string    | null: false       |
| building           | string    |                   |
| phone_number       | string    | null: false       |
| order_id           | reference | foreign_key: true |


### Association

- belongs_to :order
#