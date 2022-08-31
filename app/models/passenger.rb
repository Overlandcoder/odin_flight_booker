class Passenger < ApplicationRecord
  has_many :bookings, foreign_key: :customer_id
  has_many :booked_flights, through: :bookings, source: :flight
end
