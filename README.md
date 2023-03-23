## usersテーブル(ユーザー情報)deviseを使用

| Column                | Type      | Options                    |
| --------------------- | --------- | -------------------------- |
| nickname              | string    | null: false                |
| email                 | string    | null: false , unique: true |
| encrypted_password    | string    | null: false                |
| first_name            | string    | null: false                |
| last_name             | string    | null: false                |
| birthday              | date      | null: false                |
### Association