# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airports = Airport.create([
  { code: "YYZ", city: "Toronto" }, { code: "LGW", city: "London" },
  { code: "LAX", city: "Los Angeles" }, { code: "SFO", city: "San Francisco" },
  { code: "JFK", city: "New York" }, { code: "ATL", city: "Atlanta" },
  { code: "DFW", city: "Dallas-Fort Worth" }, { code: "DEN", city: "Denver" },
  { code: "ORD", city: "Chicago" }, { code: "LAS", city: "Las Vegas" },
  { code: "PHX", city: "Phoenix" }, { code: "MIA", city: "Miami" },
  { code: "DXB", city: "Dubai" }, { code: "FLL", city: "Fort Lauderdale" },
  { code: "AMS", city: "Amsterdam" }, { code: "DME", city: "Moscow" }
  ])

flights = Flight.create([
  {
    departure_time: "2022-12-20 07:00:00",
    duration: 10,
    departure_airport_id: 1,
    arrival_airport_id: 2
  },
  {
    departure_time: "2022-11-15 10:30:00",
    duration: 5,
    departure_airport_id: 1,
    arrival_airport_id: 3
  },
  {
    departure_time: "2022-11-21 19:30:00",
    duration: 4,
    departure_airport_id: 2,
    arrival_airport_id: 3
  },
  {
    departure_time: "2023-01-20 15:00:00",
    duration: 6,
    departure_airport_id: 2,
    arrival_airport_id: 1
  }
  ])

start = Time.now.day
finish = Time.now.day + 31

(start..finish).each do |date|
  FlightGenerator.call(date)
end
