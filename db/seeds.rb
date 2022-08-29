# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airports = Airport.create([{ code: "YYZ" }, { code: "LGW" }, { code: "LHR" }])
flights = Flight.create(
  {
    date_and_time: Time.new(2022, 10, 15, 14, 30),
    duration: 10,
    departure_airport_id: 4,
    arrival_airport_id: 5
  },
  {
    date_and_time: Time.new(2022, 11, 25, 12, 40),
    duration: 5,
    departure_airport_id: 3,
    arrival_airport_id: 5
  },
  {
    date_and_time: Time.new(2023, 1, 10, 9, 30),
    duration: 4,
    departure_airport_id: 3,
    arrival_airport_id: 4
  },
  {
    date_and_time: Time.new(2022, 12, 10, 10, 50),
    duration: 6,
    departure_airport_id: 4,
    arrival_airport_id: 3
  }
  ])
