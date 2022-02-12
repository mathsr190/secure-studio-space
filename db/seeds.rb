#曜日登録
Bday.create!(bday: "日")
Bday.create!(bday: "月")
Bday.create!(bday: "火")
Bday.create!(bday: "水")
Bday.create!(bday: "木")
Bday.create!(bday: "金")
Bday.create!(bday: "土")

#test_manager_1はスタジオの登録が済み、部屋を4つ持つ。
test_manager_1 = Manager.create(
  email: "manager1@gmail.com",
  password: "manager1",
  password_confirmation: "manager1",
  studio_name: "最高音楽劇場",
  studio_name_kana: "さいこうおんがくげきじょう")
#test_manager_2はスタジオの登録が済み、部屋を0つ持つ。
test_manager_2 = Manager.create(
  email: "manager2@gmail.com",
  password: "manager2",
  password_confirmation: "manager2",
  studio_name: "反響最適劇場",
  studio_name_kana: "はんきょうさいてきげきじょう")
#test_manager_3はスタジオの登録がされてない。
test_manager_3 = Manager.create(
  email: "manager3@gmail.com",
  password: "manager3",
  password_confirmation: "manager3",
  studio_name: "古典備品完備劇場",
  studio_name_kana: "こてんびひんかんびげきじょう")


#test_manager_1の持つスタジオ。
studio_1 = Studio.new(
  introduction: "最高の音楽を奏でるには最適なスタジオです。ぜひご利用ください。",
  postal_code: "123-4567",
  prefecture_id: 1,
  city: "最高区音楽堂",
  address: "劇場3-1-5",
  access: "最高駅から徒歩3分",
  business_hours_start: "11:55:00",
  business_hours_end: "21:30:00",
  phone_number: "12345678901",
  manager_id: test_manager_1.id
)
studio_1.image.attach(io: File.open(Rails.root.join("./public/images/seed/studio_image_1.png")), filename: 'studio_image_1.png')
studio_1.save
StudioBday.create!(studio_id: studio_1.id, bday_id: 1)
StudioBday.create!(studio_id: studio_1.id, bday_id: 2)

#test_manager_2の持つスタジオ。
studio_2 = Studio.new(
  introduction: "反響が最適なスタジオです。本番でもぜひ使っていただきたいです。",
  postal_code: "234-5678",
  prefecture_id: 2,
  city: "反響市最適化",
  address: "劇場3-1-10",
  access: "最適駅から徒歩1分",
  business_hours_start: "09:55:00",
  business_hours_end: "18:35:00",
  phone_number: "23456789012",
  manager_id: test_manager_2.id
)
studio_2.image.attach(io: File.open(Rails.root.join("./public/images/seed/studio_image_2.png")), filename: 'studio_image_2.png')
studio_2.save
StudioBday.create!(studio_id: studio_2.id, bday_id: 3)
StudioBday.create!(studio_id: studio_2.id, bday_id: 4)


#space_1_1〜space_1_4はtest_manager_1の持つスタジオの部屋。
space_1_1 = Space.new(
  info: "スピーカーで音楽を流すととっても綺麗に響きます。",
  space_name: "スピーカーぴったり部屋",
  space_name_kana: "すぴーかーぴったりべや",
  length: "1.11",
  width: "1.11",
  size: "1.11",
  height: "1.11",
  fee_morning: "1111",
  fee_day: "1112",
  fee_night: "1113",
  studio_id: studio_1.id
)
space_1_1.image.attach(io: File.open(Rails.root.join("./public/images/seed/space_image_1_1.png")), filename: 'space_image_1_1.png')
space_1_1.save

space_1_2 = Space.new(
  info: "大編成のオーケストラでも入れる部屋です。",
  space_name: "オーケストラ余裕部屋",
  space_name_kana: "おーけすとらよゆうべや",
  length: "2.2",
  width: "2.2",
  size: "2.2",
  height: "2.2",
  fee_morning: "2222",
  fee_day: "2224",
  fee_night: "2223",
  studio_id: studio_1.id
)
space_1_2.image.attach(io: File.open(Rails.root.join("./public/images/seed/space_image_1_2.png")), filename: 'space_image_1_2.png')
space_1_2.save

space_1_3 = Space.new(
  info: "作曲が捗る防音が完璧な部屋です。",
  space_name: "防音最強部屋",
  space_name_kana: "ぼうおんさいきょうべや",
  length: "3",
  width: "3",
  size: "3",
  height: "3",
  fee_morning: "3333",
  fee_day: "3332",
  fee_night: "3331",
  studio_id: studio_1.id
)
space_1_3.image.attach(io: File.open(Rails.root.join("./public/images/seed/space_image_1_3.png")), filename: 'space_image_1_3.png')
space_1_3.save

space_1_4 = Space.new(
  info: "一人で弾くのに最適な大きさです。コントラバスがちょうど入れる大きさです。",
  space_name: "小さいお部屋",
  space_name_kana: "ちいさいおへや",
  length: "4.44",
  width: "4.4",
  size: "4",
  height: "4.0",
  fee_morning: "4444",
  fee_day: "4445",
  fee_night: "4446",
  studio_id: studio_1.id
)
space_1_4.image.attach(io: File.open(Rails.root.join("./public/images/seed/space_image_1_4.png")), filename: 'space_image_1_4.png')
space_1_4.save

test_user_1 = User.create(
  email: "user1@gmail.com",
  password: "useruser1",
  password_confirmation: "useruser1",
  group_name: "ピアニッシモオーケストラ",
  group_name_kana: "ぴあにっしもおーけすとら",
  last_name: "弱",
  first_name: "記号",
  last_name_kana: "じゃく",
  first_name_kana: "きごう",
  date_of_birth: ""
)