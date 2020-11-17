# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ------------ |
| email            | string  | null: false  |
| password         | string  | null: false  |
| nickname         | string  | unique: true |
| last-name        | string  | null: false  |
| first-name       | string  | null: false  |
| last-name-kana   | string  | null: false  |
| first-name-kana  | string  | null: false  |
| birth_date_1i    | integer | null: false  |
| birth_date_2i    | integer | null: false  |
| birth_date_3i    | integer | null: false  |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| name                   | text       | null: false       |
| info                   | text       | null: false       |
| prise                  | text       | null: false       |
| user                   | references | foreign_key: true |
| category_id            |  |  |
| sales-status_id        |  |  |
| prefecture_id          |  |  |
| shipping-fee-status_id |  |  |
| scheduled-delivery_id  |  |  |

### Association

- belongs_to :user
- has_one :purchases

## purchases テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| card-number    | text       | null: false       |
| card-exp-month | text       | null: false       |
| card-exp-year  | text       | null: false       |
| card-cvc       | text       | null: false       |
| user           | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping-address

## shipping-addresses テーブル

| Column         | Type | Options           |
| -------------- | ---- | ----------------- |
| postal-code    | text | null: false       |
| prefecture_id  | text | null: false       |
| city           | text | null: false       |
| addresses      | text | null: false       |
| building       | text | foreign_key: true |
| phone-number   | text | foreign_key: true |

### Association

- belongs_to :purchase
