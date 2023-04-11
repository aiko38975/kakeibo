## アプリケーション名
家計簿アプリ

## アプリケーション概要
支出の保存と管理

## URL
https://kakeibo-8m8y.onrender.com


## テスト用アカウント
* Basic認証ID: admin
* Basic認証パスワード: 2222
* メールアドレス: test@test
* パスワード: 1111qq

## 利用方法
### 支出登録
1.トップページから新規登録を行う
2.支出登録事項に入力をして保存する
### 統計の確認
1.マイページのメニューから「統計表示」を押し、統計ページへ遷移する

## アプリケーションを作成した背景
母がパソコンを学びたいと思っているが、きっかけがなく実行に移すことができない。
そこで、家計簿をノートに手書きで書いている点に注目し、家計簿の記録をきっかけとしてパソコンに触れてほしいと思い、開発することにした。

## 洗い出した要件
要件定義書

## 実装した機能についての説明
画像やGIF、説明を記載〜

## 実装予定の機能
* カテゴリーの編集機能
* 
* 

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/9f063cb0143da0c62a64ac95a7c984c9.png)](https://gyazo.com/9f063cb0143da0c62a64ac95a7c984c9)

## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/22633bf38e84c387063897e4fa6260e2.png)](https://gyazo.com/22633bf38e84c387063897e4fa6260e2)

## 開発環境
- Ruby 2.6.5
- Ruby on Rails
- PostgreSQL

##　ローカルでの動作方法

## 工夫したポイント
家計簿アプリは数多くあるが、多機能である故、母の世代はアプリを使用することを敬遠している。
そこで、最低限の機能に絞りながらも使いやすいアプリの作成を目指した。
母は支出のみの記録をつけているので、支出の機能に絞った。
今後、カテゴリの編集機能を実装した場合、医療費控除のための記録等にも活用できる。


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


