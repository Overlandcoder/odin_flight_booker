# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airports = Airport.create([{ code: "YYZ" }, { code: "LGW" }, { code: "LHR" }])
flights = Flight.create([
  {
    departure_time: "2022-12-20 07:00:00",
    duration: 10,
    departure_airport_id: 4,
    arrival_airport_id: 5
  },
  {
    departure_time: "2022-11-15 10:30:00",
    duration: 5,
    departure_airport_id: 3,
    arrival_airport_id: 5
  },
  {
    departure_time: "2022-11-21 19:30:00",
    duration: 4,
    departure_airport_id: 3,
    arrival_airport_id: 4
  },
  {
    departure_time: "2023-01-20 15:00:00",
    duration: 6,
    departure_airport_id: 4,
    arrival_airport_id: 3
  }
  ])
