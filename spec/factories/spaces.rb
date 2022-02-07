FactoryBot.define do
  factory :space do
    # reservation_form_spec.rbで使用するためのもの
    # 普通のspaceのmodelのテストでは使用しない。
    info              { Faker::Lorem.characters(number: 198) }
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
    association :studio

    after(:build) do |space|
      space.image.attach(io: File.open('public/images/space_test_image.png'), filename: 'space_test_image.png')
    end
  end
end
