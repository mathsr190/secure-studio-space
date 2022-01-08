FactoryBot.define do
  factory :manager do
    email { Faker::Internet.free_email }
    gimei = Gimei.name.last # gimeiでひらがな自動生成代用
    studio_name           { gimei.kanji }
    studio_name_kana      { gimei.hiragana }
    password = Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)
    password              { password }
    password_confirmation { password }
  end
end
