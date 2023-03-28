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

## recordsテーブル
| Column                | Type       | Options                       |
| --------------------- | ---------  | ----------------------------- |
| recorded_at           | datetime   | null: false                   |
| price                 | integer    | null: false                   |
| description           | text       |                               |
| user                  | references | null: false, foreign_key: true|
### Association


## incomesテーブル 　確認する
| Column                | Type       | Options                       |
| --------------------- | ---------  | ----------------------------- |
| incomed_at            | datetime   | null: false                   |
| price                 | integer    | null: false                   |
| description           | text       |                               |
| user                  | references | null: false, foreign_key: true|
### Association
belongs_to :user


## spendingsテーブル　確認する
| Column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| spended_at            | datetime   | null: false                   |
| spending_way_id       | integer    | null: false                   |Active hash
| spending_pay_id       | integer    | null: false                   |Active hash
| price                 | integer    | null: false                   |
| description           | text       |                               |
| user                  | references | null: false, foreign_key: true|
### Association
belongs_to :user


## budgetsテーブル
| Column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| budeget_at            | datetime   | null: false                   |
| price                 | integer    | null: false                   |
| description           | text       |                               |
| user                  | references | null: false, foreign_key: true|
### Association
blongs_to :user


