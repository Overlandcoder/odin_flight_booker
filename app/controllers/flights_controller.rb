class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flights = Flight.all
    @searched_flights = Flight.user_search(query_params)
  end

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)

    if @flight.save
      redirect_to @flight
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def flight_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id,
                                   :date)
  end

  def query_params
    params.permit(:departure_airport_id, :arrival_airport_id,
                                   :passengers, :flight_time, :commit)
  end
end
