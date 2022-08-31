class Booking < ApplicationRecord
  belongs_to :customer, class_name: "Passenger"
  belongs_to :flight
end
