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

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| category           | string     | null: false                    |
| status             | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| information        | text       | null: false                    |
| price              | integer    | null: false                    |
| status             | string     | null: false                    |
| area               | string     | null: false                    |
| date               | date       | null: false                    |
| delivery_charge    | string     | null: false                    |

### Association

- has_many :comments
- belongs_to :users

## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| content            | text       | null: false                    |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items