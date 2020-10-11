# README

# アプリケーション名
 Weg(ヴェーク)

# アプリケーション概要
- 新規ユーザー登録・ログイン・ログアウトのユーザー管理機能
- 画像を含めた投稿（ツイート）機能
- 投稿したツイートの編集・削除機能
- 投稿に対してのメッセージ機能
- 投稿に対して「いいね」を押すことができる機能
- ユーザーの投稿が見えるマイページ  
→自動車を通したコミュニティサイト

# URL
 https://weg-29286.herokuapp.com/

# テスト用アカウント
- Basic認証（ID:tatsu0808, Pass:t7130808）
- ログインユーザー1（ユーザー名:tatsuki, Email:tatsuki@kawabe, Pass:t7130808）
- ログインユーザー2（ユーザー名:kawabe, Email:kawabe@tatsuki, Pass:t7130808）

# 利用方法
 新規登録でユーザー情報を登録して、postボタンから投稿をする。投稿したらトップページに表示されるため画像を押下で投稿詳細ページに飛ぶため、そこでコメントやいいねを押したりして交流を図る。

# 目指した課題解決
 近年「若者の自動車離れ」という言葉が叫ばれている中、18歳〜30歳くらいの若者層をターゲットにして、日本を支えている産業である自動車を通したコミュニケーションを図ることで社会を少しでも盛り上げたいという思いから作成。

# 洗い出した要件
- デプロイ設定  
  本番環境でアプリを作動できるようにするため
- Basic認証  
  セキュリティ強化をするため
- ユーザー管理機能  
  ユーザーを管理することで機能の幅も広がる
- 投稿機能  
  コミュニティサイトにおいてユーザー間で交流ができるようにするため  
  詳細としては出来事などの画像・文章を投稿する  
- 投稿の詳細機能  
  投稿ユーザー自身であれば投稿の編集・削除を行うことができる  
  間違えて投稿してしまったりしても修正できる  
  マイページにも遷移できる
- メッセージ機能  
  他ユーザーの投稿にメッセージが送れることでユーザー間の交流を促進する

# 実装した機能についてのGIFと説明
- ユーザー新規登録  
  新規登録ページにて情報入力するとトップページにユーザー名が表示される  
  https://gyazo.com/d2e6aa8af34d0ef201edad68b0ceaf57
- ログアウト  
  ログアウトボタン押下でログアウト状態になる  
  https://gyazo.com/366abb45aa505e073f67e9e990068e6d
- ログイン  
  ログインボタンを押下し、emailとpassword入力でログイン  
  https://gyazo.com/b93e8569836b897290d564970e19f674
- 新規投稿  
  postボタン押下で投稿ページに遷移し、情報入力後投稿でトップページに投稿が表示される  
  https://gyazo.com/acddd21bdeabf1eccb57c8fdee75990b  
  https://gyazo.com/60686783cf9d4d600064a72aeaa02625
- 投稿詳細へ遷移  
  トップに表示されている投稿を押下すると投稿の詳細ページに遷移する  
  https://gyazo.com/49222abafc34d28d2da79768dfca6768
- いいね機能  
  詳細ページにてハートボタンを押下するといいね機能が作動する  
  https://gyazo.com/62591f74fbfc1a86e091ce51a67aaf14
- 投稿の編集機能  
  投稿詳細ページにて投稿者自身がsetting menuを選択すると編集ボタンが現れ編集ページに遷移し、編集ができる  
  https://gyazo.com/ee188c6936a16589106b9d77d9523ea6  
  https://gyazo.com/205117ed8ad314b70ee95a7ca9bf6733
- コメント機能  
  投稿詳細ページにてコメント欄に入力するとコメントができる  
  https://gyazo.com/0d5d86c821aa8c69bc8e29021ea87e6c
- マイページ遷移  
  投稿詳細のsetting menuからmy page選択か、トップ上部のユーザー名を選択するとそのユーザーの投稿が見えるマイページへ遷移する  
  https://gyazo.com/1feb7eedd3c9db1c829212289c1f5558  
  https://gyazo.com/a94a3cb5236b7c4743c853411023926b
- 投稿削除機能  
  投稿詳細ページのsetting menuよりdeleteを選択すると、投稿を削除できる  
  https://gyazo.com/3533dd197a9b0d9197d1efb9a0667b15


# 実装予定の機能
- 画像投稿において、複数枚の画像を投稿できるようにする
- 違うユーザーのページにも遷移できるようにする
- jqueryを使用して画像が変化する背景も導入していきたい
- 検索機能

# データベース設計
- ER図  
https://gyazo.com/002d24a47659ec15b85591263a0aa8ef


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

