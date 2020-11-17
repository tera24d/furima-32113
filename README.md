# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ------------ |
| email              | string  | null: false  |
| encrypted_password | string  | null: false  |
| nickname           | string  | unique: true |
| last_name          | string  | null: false  |
| first_name         | string  | null: false  |
| last_name_kana     | string  | null: false  |
| first_name_kana    | string  | null: false  |
| birth_date         | date    | null: false  |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| name                   | text       | null: false       |
| info                   | text       | null: false       |
| price                  | text       | null: false       |
| user                   | references | foreign_key: true |
| category_id            | integer    | null: false       |
| sales-status_id        | integer    | null: false       |
| prefecture_id          | integer    | null: false       |
| shipping-fee-status_id | integer    | null: false       |
| scheduled-delivery_id  | integer    | null: false       |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| item   | references | foreign_key: true |
| user   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping-address

## shipping-addresses テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal-code    | string  | null: false |
| prefecture_id  | integer | null: false |
| city           | string  | null: false |
| addresses      | string  | null: false |
| building       | string  | null: false |
| phone-number   | string  | null: false |

### Association

- belongs_to :purchase
