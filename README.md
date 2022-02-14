# アプリケーション名
Secure Studio Space
# アプリケーション概要
音楽活動の練習部屋(space)を予約できる。
スタジオ管理者はスタジオ(studio)の情報、および部屋の情報を登録・編集できる。
利用者側はスタジオ情報の閲覧、部屋の予約ができる。

# URL
https://secure-studio-space.herokuapp.com/


# テスト用アカウント

## Basic認証
ID: admin
PW: 2222

## スタジオ管理者ログイン情報
mail: manager1@gmail.com
PW: manager1

## 利用者ログイン情報
mail: user1@gmail.com
PW: useruser1

# 利用方法
## スタジオ管理者の利用
スタジオ管理者としてログイン。
スタジオ管理者はマイページから登録したスタジオの確認ができる。
スタジオの詳細ページにスタジオ情報編集ボタンが現れる。そこから編集が可能。
各部屋のページに情報編集ボタンが現れる。そこから編集が可能。
スタジオ・部屋ともに削除はできない仕様である。

## 利用者の利用
利用者としてログイン。
スタジオの各ページの詳細情報が見られる。
各部屋のページに予約ボタンが現れる。そこから予約が可能。
予約情報はマイページから確認ができる。

# 目指した課題解決(制作背景)
音楽活動をする上で重要なのが練習場所の確保である。ただ、練習場所となるそれぞれのスタジオが各ページを所有し、見た目もバラバラ、掲載情報もバラバラなのが現状である。利用者にとっては情報を得るのが煩わしく、またスタジオ管理者にとっては新規利用見込みの方にアプローチしづらいといった課題があった。統一したページにすることで、それらの課題を解決できると考えた。

# 要件

- manager(スタジオ管理者)登録・ログイン機能
- studio登録、編集機能
- space登録、編集機能
- user(利用者)登録・ログイン機能
- 予約機能

# 実装した機能についての画像および説明

- manager(スタジオ管理者)登録・ログイン機能

[![Image from Gyazo](https://i.gyazo.com/d0cc5c8cb1f5269cdd4515f03e7cfaec.gif)](https://gyazo.com/d0cc5c8cb1f5269cdd4515f03e7cfaec)

[![Image from Gyazo](https://i.gyazo.com/1f4935576612b2f520520b96cda6f128.gif)](https://gyazo.com/1f4935576612b2f520520b96cda6f128)

deviseを用いて実装。ログイン後はトップページに遷移し、ログイン中のスタジオ名が表示される。
※本来アプリケーションとしては利用者ログインと同じ画面に並んではいけないが、実装した機能を分かりやすくするためにこのような表示となっている。

- studio登録、編集機能

[![Image from Gyazo](https://i.gyazo.com/ccb9377658bcbed650f89db1fbb6793d.gif)](https://gyazo.com/ccb9377658bcbed650f89db1fbb6793d)

[![Image from Gyazo](https://i.gyazo.com/b82748df968c1e66802204525ef009df.gif)](https://gyazo.com/b82748df968c1e66802204525ef009df)

studio登録、編集ともに同じフォームを利用している。managerログイン時のみ編集できる。

- space登録、編集機能

[![Image from Gyazo](https://i.gyazo.com/8914d4838689b13301488d86737e46ca.gif)](https://gyazo.com/8914d4838689b13301488d86737e46ca)

[![Image from Gyazo](https://i.gyazo.com/c39299e50568a64939e94b3c409535ef.gif)](https://gyazo.com/c39299e50568a64939e94b3c409535ef)

space登録、編集ともに同じフォームを利用している。managerログイン時のみ編集できる。

- user(利用者)登録・ログイン機能

[![Image from Gyazo](https://i.gyazo.com/66240ecb6eed2244cb4f9416d7f7f766.gif)](https://gyazo.com/66240ecb6eed2244cb4f9416d7f7f766)

[![Image from Gyazo](https://i.gyazo.com/315ccd928018aae2be23cbdf29b85247.gif)](https://gyazo.com/315ccd928018aae2be23cbdf29b85247)

deviseを用いて実装。ログイン後はトップページに遷移し、ログイン中のuser名が表示される。
※本来アプリケーションとしては利用者ログインと同じ画面に並んではいけないが、実装した機能を分かりやすくするためにこのような表示となっている。

- 予約機能

[![Image from Gyazo](https://i.gyazo.com/b595e72b02792efc4b6c63398777a025.gif)](https://gyazo.com/b595e72b02792efc4b6c63398777a025)

予約をするとマイページに予約情報が表示される。
※料金を入力できる仕様になっています。本来は自動計算して表示させるべきであるが、予約機能そのものを優先して実装した。



# 実装予定の機能

- 予約空き状況表示機能
- 予約時料金自動計算機能
- studioからのお知らせ投稿機能
- スタジオ地図表示機能
- 口コミ投稿機能
- studio検索機能



# データベース設計

## ER図
[![Image from Gyazo](https://i.gyazo.com/f36b0c01262600f2a72d2ffbabd2df75.png)](https://gyazo.com/f36b0c01262600f2a72d2ffbabd2df75)




# テーブル設計

## managersテーブル
| Column            | Type   | Options                   |
| ----------------- | ------ | ------------------------- |
| email             | string | null: false, unique: true |
| studio_name       | string | null: false               |
| studio_name_kana  | string | null: false               |

### Association
- has_one :studio


## studiosテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| introduction         | text       | null: false                    |
| postal_code          | string     | null: false                    |
| prefecture_id        | integer    | null: false                    |
| city                 | string     | null: false                    |
| address              | string     | null: false                    |
| access               | string     | null: false                    |
| business_hours_start | time       | null: false                    |
| business_hours_end   | time       | null: false                    |
| phone_number         | string     | null: false                    |
| manager              | references | null: false, foreign_key: true |

### Association
- belongs_to :manager
- has_many :spaces


## spacesテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| info                 | text       | null: false                    |
| space_name           | string     | null: false                    |
| space_name_kana      | string     | null: false                    |
| length               | float      | null: false                    |
| width                | float      | null: false                    |
| size                 | float      | null: false                    |
| height               | float      | null: false                    |
| fee_morning          | integer    | null: false                    |
| fee_day              | integer    | null: false                    |
| fee_night            | integer    | null: false                    |
| studio               | references | null: false, foreign_key: true |

### Association
- belongs_to :studio
- has_many :reservations


## usersテーブル
| Column            | Type    | Options                   |
| ----------------- | ------- | ------------------------- |
| email             | string  | null: false, unique: true |
| group_name        | string  | null: false               |
| group_name_kana   | string  | null: false               |
| last_name         | string  | null: false               |
| first_name        | string  | null: false               |
| last_name_kana    | string  | null: false               |
| first_name_kana   | string  | null: false               |
| date_of_birth     | date    | null: false               |
| phone_number      | string  | null: false               |
| postal_code       | string  | null: false               |
| prefecture_id     | integer | null: false               |
| city              | string  | null: false               |
| address           | string  | null: false               |
| building          | string  |                           |

### Association
- has_many :reservations


## reservationsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| space  | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :space
- belongs_to :user
- has_one :reservation_detail


## reservation_detailsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| time_start    | datetime   | null: false                    |
| time_end      | datetime   | null: false                    |
| price         | integer    | null: false                    |
| reservation   | references | null: false, foreign_key: true |

### Association
- belongs_to :reservation

# ローカルでの動作方法
clone後は初めに

- rails db:migrate:reset
- rails db:seed

を実行してください。

## Version情報

- ruby '2.6.5'
- rails '6.0.0'
- mysql2 '0.4.4'
