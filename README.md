# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| firstname_in_kanji | string | null: false               |
| lastname_in_kanji  | string | null: false               |
| firstname_in_kana  | string | null: false               |
| lastname_in_kana   | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :purchase_logs
- has_many :addresses

## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| category_id           | integer    | null: false                    |
| status_id             | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |
| information           | text       | null: false                    |
| price                 | integer    | null: false                    |
| area_id               | integer    | null: false                    |
| scheduled_delivery_id | integer    | null: false                    |
| delivery_charge_id    | integer    | null: false                    |

### Association

- has_many :comments
- belongs_to :user
- has_one :purchase_log
- has_one :address

## purchase_logs テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |
| post_code             | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| city                  | string     | null: false                    |
| address               | string     | null: false                    |
| building              | string     |                                |
| phone_number          | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| content            | text       | null: false                    |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item