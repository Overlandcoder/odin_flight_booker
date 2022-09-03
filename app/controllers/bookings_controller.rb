class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @num_of_passengers = params[:num_of_passengers]
    @booking.passengers.build
  end

  def create
    @flight = Flight.find(booking_params[:flight_id])
    @booking = @flight.bookings.build(booking_params)

    if @booking.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id,
                                    passengers_attributes: [:name, :email])
  end
end
