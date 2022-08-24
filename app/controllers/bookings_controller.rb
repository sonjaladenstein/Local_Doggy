class BookingsController < ApplicationController
  def create
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new(bookings_params)
    @booking.dog = @dog
    @booking.user = current_user
    if @booking.save!
      redirect_to dog_booking_path(@booking, @dog)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def new
    @booking = Booking.new
    @dog = Dog.find(params[:dog_id])
  end

  def show
    @booking = Booking.find(@dog, params[:id])
  end

  def destroy
    @booking = Booking.find(@dog, params[:id])
    @booking.delete
    redirect_to dog_path, status: :see_other
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
