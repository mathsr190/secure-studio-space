FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    group = Gimei.name # gimeiでひらがな自動生成代用
    gimei = Gimei.name # gimeiでひらがな自動生成代用
    group_name          { group.last.kanji }
    group_name_kana     { gimei.last.hiragana }
    last_name           { gimei.last }
    first_name          { gimei.first }
    last_name_kana      { gimei.last.hiragana }
    first_name_kana     { gimei.first.hiragana }
    date_of_birth       { Faker::Date.between(from: '1900-01-01', to: Date.today) }
    phone_number        { Faker::Number.number(digits: 10) }
    postal_code = Faker::Number.number(digits: 7).to_s.insert(3, '-')
    postal_code         { postal_code }
    prefecture_id       { Faker::Number.between(from: 1, to: 47) }
    city                { Faker::Address.city }
    address             { Faker::Address.street_name }
    building            { Faker::Address.street_address }
    password = Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)
    password              { password }
    password_confirmation { password }
  end
end
