FactoryBot.define do
  factory :studio do
    introduction         { Faker::Lorem.sentence }
    postal_code = Faker::Number.number(digits: 7).to_s.insert(3, '-')
    postal_code          { postal_code }
    prefecture_id        { Faker::Number.between(from: 1, to: 47) }
    city                 { Faker::Address.city }
    address              { Faker::Address.street_name }
    access               { Faker::Lorem.sentence }
    business_hours_start { Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all) }
    business_hours_end   { Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all) }
    phone_number         { Faker::Number.number(digits: 10) }
    association :manager

    after(:build) do |studio|
      studio.image.attach(io: File.open('public/images/studio_test_image.png'), filename: 'studio_test_image.png')
      #create_list(:bday, 3, studios: [studio])
      #下2つが有力説
      #bday = FactoryBot.create(:bday)
      #create_list(:bday, 1, studios:[studio], bday: bday)
      #create_list(:studio_bday, 1, studio: studio, bday: create(:bday))
    end

  end
end
