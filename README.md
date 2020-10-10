# README

# アプリケーション名
 Weg

# アプリケーション概要
 新規ユーザー登録・ログイン・ログアウトのユーザー管理機能、
 画像を含めた投稿（ツイート）が可能、
 投稿したツイートの編集・削除機能、
 投稿に対してのメッセージ機能、
 投稿に対して「いいね」を押すことができる、
 ユーザーの投稿が見えるマイページ
 →自動車を通したコミュニティサイト

# URL
 https://weg-29286.herokuapp.com/

# テスト用アカウント
 Basic認証（ID:tatsu0808, Pass:t7130808）
 ログインユーザー1（ユーザー名:tatsuki, Email:tatsuki@kawabe, Pass:t7130808）
 ログインユーザー2（ユーザー名:kawabe, Email:kawabe@tatsuki, Pass:t7130808）

# 利用方法
 新規登録でユーザー情報を登録して、postボタンから投稿をする。投稿したらトップページに表示されるため画像を押下で投稿詳細ページに飛ぶため、そこでコメントやいいねを押したりして交流を図る。

# 目指した課題解決
 近年「若者の自動車離れ」という言葉が叫ばれている中、18歳〜30歳くらいの若者層をターゲットにして、日本を支えている産業である自動車を通したコミュニケーションを図ることで社会を少しでも盛り上げたいという思いから作成。

# 洗い出した要件
・デプロイ設定
  本番環境でアプリを作動できるようにするため
・Basic認証
  セキュリティ強化するため
・ユーザー管理機能
  ユーザーを管理することで機能の幅も広がる
・投稿機能
  コミュニティサイトにおいてユーザー間で交流ができるようにするため
  詳細としては出来事などの画像・文章を投稿する
・投稿の詳細機能
  投稿ユーザー自身であれば投稿の編集・削除を行うことができる
  間違えて投稿してしまったりしても修正できる
  マイページにも遷移できる
・メッセージ機能
  他ユーザーの投稿にメッセージが送れることでユーザー間の交流を促進する

# 実装した機能についてのGIFと説明


# 実装予定の機能
・画像投稿において、複数枚の画像を投稿できるようにする
・違うユーザーのページにも遷移できるようにする
・jqueryを使用して画像が変化する背景も導入していきたい
・検索機能

# データベース設計

# ローカルでの動作方法







# テーブル設計

## users テーブル

| Column             |  Type   | Options      |
| ------------------ | --------| -------------|
| nickname           | string  | null: false  |
| email              | string  | null: false  |
| encrypted_password | string  | null: false  |
| favorite_car_id    | integer | null: false  |

### Association
- has_many :tweets
- has_many :comments
- has_many :likes
- belongs_to_active_hash :favorite_car





## tweets テーブル

| Column             |  Type      | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| brand_id           | integer    | null: false                    |
| type_id            | integer    | null: false                    |
| model_year_id      | integer    | null: false                    |
| title              | string     | null: false                    |
| caption            | text       | null: false                    |


### Association
- belongs_to :user
- has_many :comments
- has_many :likes
- belongs_to_active_hash :brand
- belongs_to_active_hash :type
- belomgs_to_active_hash :model_year




## comments テーブル

| Column             |  Type      | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| tweet              | references | null: false, foreign_key: true |
| text               | text       | null: false                    |



### Association
- belongs_to :user
- belongs_to :tweet




## likes テーブル

| Column            |  Type      | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| tweet             | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :tweet

