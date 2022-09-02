class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(booking_params[:flight_id])
    @passengers = params[:passengers]
  end

  private
  def booking_params
    params.permit(:flight_id, :passengers, :customer, :commit)
  end
end
