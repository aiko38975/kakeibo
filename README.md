## URL
https://kakeibo-8m8y.onrender.com

## 使用技術
- Ruby 2.6.5
- Ruby on Rails
- PostgreSQL


## 機能一覧
- ユーザー登録、ログイン機能（devise）
- 支出登録機能
- 支出一覧表示機能
- 支出統計表示機能


## usersテーブル

| Column                | Type      | Options                    |
| --------------------- | --------- | -------------------------- |
| nickname              | string    | null: false                |
| email                 | string    | null: false , unique: true |
| encrypted_password    | string    | null: false                |
### Association
has_many :records


## recordsテーブル

| Column                | Type       | Options                       |
| --------------------- | ---------  | ----------------------------- |
| recorded_at           | datetime   | null: false                   |
| price                 | integer    | null: false                   |
| description           | text       |                               |
| pending_way_id        | integer    | null: false                   |
| spending_pay_id       | integer    | null: false                   |
| user                  | references | null: false, foreign_key: true|
### Association
belongs_to :user


