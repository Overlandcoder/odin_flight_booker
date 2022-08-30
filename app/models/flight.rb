class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :departure_time, presence: true
  validates :duration, presence: true

  scope :same_departure, ->(query_params) { where("departure_airport_id == ?", query_params[:departure_airport_id]) }
  scope :same_arrival, ->(query_params) { where("arrival_airport_id == ?", query_params[:arrival_airport_id]) }
  scope :same_time, ->(query_params) { where("departure_time == ?", query_params[:flight_time]) }

  def self.user_search(query_params)
    same_departure
  end
end
