class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :departure_time, presence: true
  validates :duration, presence: true

  def self.user_search(query_params)
    where(departure_airport_id: query_params[:departure_airport_id]).
    where(arrival_airport_id: query_params[:arrival_airport_id]).
    where(departure_time: query_params[:departure_time])
  end

  def departure_date_formatted
    departure_time.strftime("%m/%d/%Y")
  end
end
