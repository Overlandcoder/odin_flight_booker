class FlightGenerator < ApplicationService
  def initialize(date)
    @date = date
  end

  def call
    airport_pairs.each do |pair|
      airport1 = Airport.find_by(code: pair[0])
      airport2 = Airport.find_by(code: pair[1])

      Flight.create(departure_time: random_time, duration: rand(3..15),
                    departure_airport_id: airport1.id,
                    arrival_airport_id: airport2.id)
    end
  end

  def random_time
    Faker::Time.between_dates(from: @date, to: @date, period: :all)
  end

  def airport_pairs
    ["YYZ", "LGW", "JFK", "ATL", "DFW",
    "DEN", "ORD", "LAS", "PHX", "MIA"].permutation(2)
  end
end