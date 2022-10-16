FactoryBot.define do
  factory :flight do
    day = Date.today + 1
    departure_date { day }
    departure_time { Faker::Time.between_dates(from: day, to: day, period: :all) }
    duration { 1.5 }

    association :departure_airport, factory: :airport
    association :arrival_airport, factory: :airport
  end
end
