class Flight < ApplicationRecord
  has_many :bookings
  has_many :passengers, through: :bookings, source: :customer
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :departure_time, presence: true
  validates :duration, presence: true

  def self.user_search(query_params)
    where(departure_airport_id: query_params[:departure_airport_id],
          arrival_airport_id: query_params[:arrival_airport_id],
          departure_time: query_params[:departure_time])
  end

  def departure_date_formatted
    departure_time.strftime("%m/%d/%Y")
  end

  def flight_info
    "#{departure_airport.code} to #{arrival_airport.code} - #{departure_date_formatted}"
  end
end
