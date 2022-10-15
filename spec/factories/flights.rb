FactoryBot.define do
  factory :flight do
    departure_time { Date.today + 1 }
    duration { 1.5 }

    association :departure_airport, factory: :airport
    association :arrival_airport, factory: :airport
  end
end
