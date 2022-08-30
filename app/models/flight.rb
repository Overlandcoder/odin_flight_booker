class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :departure_time, presence: true
  validates :duration, presence: true

  scope :same_departure, -> { where("departure_airport_id == ?", [:departure_airport_id]) }
  scope :same_arrival, -> { where("arrival_airport_id == ?", [:arrival_airport_id]) }
  scope :same_time, -> { where("departure_time == ?", [:flight_time]) }

  def self.user_search(query_params)
    same_departure.same_arrival.same_time
  end
end
