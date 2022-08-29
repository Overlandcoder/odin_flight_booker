class FlightsController < ApplicationController
  def index
    @flights = Flight.all
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
    params.require(:flight).permit(:time, :duration)
  end
end
