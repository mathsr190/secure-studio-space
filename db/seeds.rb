test_manager_1 = Manager.create(email: "manager1@gmail.com", password: "manager1", password_confirmation: "manager1", studio_name: "最高音楽劇場", studio_name_kana: "さいこうおんがくげきじょう")
test_manager_2 = Manager.create(email: "manager2@gmail.com", password: "manager2", password_confirmation: "manager2", studio_name: "反響最適劇場", studio_name_kana: "はんきょうさいてきげきじょう")

Bday.create!(bday: "日")
Bday.create!(bday: "月")
Bday.create!(bday: "火")
Bday.create!(bday: "水")
Bday.create!(bday: "木")
Bday.create!(bday: "金")
Bday.create!(bday: "土")

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
studio_1.image.attach(io: File.open(Rails.root.join("./public/images/studio_test_image.png")), filename: 'studio_test_image.png')
studio_1.save
StudioBday.create!(studio_id: studio_1.id, bday_id: 1)
StudioBday.create!(studio_id: studio_1.id, bday_id: 2)

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
studio_2.image.attach(io: File.open(Rails.root.join("./public/images/studio_test_image.png")), filename: 'studio_test_image.png')
studio_2.save
StudioBday.create!(studio_id: studio_2.id, bday_id: 3)
StudioBday.create!(studio_id: studio_2.id, bday_id: 4)



#t.time       :business_hours_start, null: false
#t.time       :business_hours_end,   null: false
#t.string     :phone_number,         null: false
#t.references :manager,              null: false, foreign_key: true


