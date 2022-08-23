class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = booking.new(bookings_params)
    @booking.save!
    redirect_to bookings_path
  end
  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :id_user, :id_dog)
  end
end
