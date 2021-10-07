
# テーブル設計

## Users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | NOT NULL    |
| email              | string | NOT NULL    |
| password           | string | NOT NULL    |

### Association

- has_many :item
- has_many :order
- has_one  :plofile


## Plofiles テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| last_name          | string    | NOT NULL    |
| first_name         | string    | NOT NULL    |
| last_name_kana     | string    | NOT NULL    |
| first_name_kana    | string    | NOT NULL    |
| birth_date         | datetime  | NOT NULL    |
| user_id            | reference |             |

### Association

- belongs_to :user


## Items テーブル

| Column                   | Type      | Options            |
| ------------------------ | --------- | ------------------ |
| item_image               | image     | ActiveStorageで実装 |
| item_name                | string    | NOT NULL           |
| item_info                | text      | NOT NULL           |
| item_category            | integer   | NOT NULL           |
| item_sales_status        | reference | NOT NULL           |
| item_shipping_fee_status | boolean   | NOT NULL           |
| item_prefecture          | integer   | NOT NULL           |
| item_scheduled_delivery  | integer   | NOT NULL           |
| item_price               | integer   | NOT NULL           |
| user_id                  | reference |                    |

### Association

- belongs_to :user
- has_one    :order


## Orders テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| postal_code        | string    | NOT NULL    |
| prefecture         | integer   | NOT NULL    |
| city               | string    | NOT NULL    |
| addresses          | string    | NOT NULL    |
| building           | string    |             |
| phone_number       | integer   | NOT NULL    |
| user_id            | reference |             |
| item_id            | reference |             |


### Association

- belongs_to :user
- belongs_to :item

