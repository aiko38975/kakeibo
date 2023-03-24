## usersテーブル(ユーザー情報)deviseを使用
| Column                | Type      | Options                    |
| --------------------- | --------- | -------------------------- |
| nickname              | string    | null: false                |
| email                 | string    | null: false , unique: true |
| encrypted_password    | string    | null: false                |
### Association
has_many :incomes
has_many :spendings
has_many :budgets


## incomesテーブル
| Column                | Type       | Options                       |
| --------------------- | ---------  | ----------------------------- |
| incomed_at            | datetime   | null: false                   |
| price                 | integer    | null: false                   |
| description           | text       |                               |
| user                  | references | null: false, foreign_key: true|
### Association
blongs_to :user


## spendingsテーブル
| Column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| spended_at            | datetime   | null: false                   |
| spendingway_id        | integer    | null: false                   |Active hash
| pay_id                | integer    | null: false                   |Active hash
| price                 | integer    | null: false                   |
| description           | text       |                               |
| user                  | references | null: false, foreign_key: true|
### Association
blongs_to :user


## budgetsテーブル
| Column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| budeget_at            | datetime   | null: false                   |
| price                 | integer    | null: false                   |
| description           | text       |                               |
| user                  | references | null: false, foreign_key: true|
### Association
blongs_to :user


