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
| bday_ids             | text       | null: false                    |
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


# はじめに
rails db:migrate:reset
rails db:seed
を実施してください。