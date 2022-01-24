FactoryBot.define do
  factory :reservation_form do
    time = Faker::Time.between_dates(from: Date.today + 1, to: Date.today + 90, period: :all)
    time_start   { time }
    time_end     { time + 1 * 60 }
    price        { 2400 }
    token        { 'tok_abcdefghijk00000000000000000' }
  end
end
