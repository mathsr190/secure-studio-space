FactoryBot.define do
  factory :space_form do
    info              { Faker::Lorem.sentence }
    gimei = Gimei.name.last # gimeiでひらがな自動生成代用
    space_name        { gimei.kanji }
    space_name_kana   { gimei.hiragana }
    length            { Faker::Number.between(from: 0.01, to: 2499.99).floor(2).to_f }
    width             { Faker::Number.between(from: 0.01, to: 2499.99).floor(2).to_f }
    size              { Faker::Number.between(from: 0.01, to: 2499.99).floor(2).to_f }
    height            { Faker::Number.between(from: 0.01, to: 2499.99).floor(2).to_f }
    fee_morning       { Faker::Number.between(from: 0).to_i }
    fee_day           { Faker::Number.between(from: 0).to_i }
    fee_night         { Faker::Number.between(from: 0).to_i }
    # 修正が入る場合はspaces.rbも変更する。reservation_formのテストで使用するため。
  end
end
