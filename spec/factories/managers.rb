FactoryBot.define do
  factory :manager do
    email                 {'test@example'}
    studio_name           {'芸術館'}
    studio_name_kana      {'げいじゅつかん'}
    password              {'000000'}
    password_confirmation {password}
  end
end