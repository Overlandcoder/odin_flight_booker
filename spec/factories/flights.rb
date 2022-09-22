FactoryBot.define do
  factory :flight do
    departure_time { "2022-09-21 22:01:21" }
    duration { 1.5 }

    association :departure_airport, factory: :airport
    association :arrival_airport, factory: :airport
  end
end
