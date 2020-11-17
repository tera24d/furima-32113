# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| email            | string  | null: false |
| password         | string  | null: false |
| nickname         | string  | null: false |
| last-name        | string  | null: false |
| first-name       | string  | null: false |
| last-name-kana   | string  | null: false |
| first-name-kana  | string  | null: false |
| birth_date_1i    | integer | null: false |
| birth_date_2i    | integer | null: false |
| birth_date_3i    | integer | null: false |

### Association

- has_many :items

## items テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| name   | string     | null: false       |
| info   | text       | null: false       |
| prise  | integer    | null: false       |
| user   | references | foreign_key: true |

### Association

- belongs_to :user
