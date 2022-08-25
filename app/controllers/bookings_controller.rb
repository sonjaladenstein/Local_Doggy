class BookingsController < ApplicationController

  def create
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new(bookings_params)
    @booking.start_date = Date.new(params[:booking]["start_date(1i)"].to_i, params[:booking]["start_date(2i)"].to_i, params[:booking]["start_date(3i)"].to_i)
    @booking.end_date = Date.new(params[:booking]["end_date(1i)"].to_i, params[:booking]["end_date(2i)"].to_i, params[:booking]["end_date(3i)"].to_i)
    @booking.dog = @dog
    @booking.user = current_user
    if @booking.save!
      redirect_to dog_booking_path(@dog, @booking)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def new
    @booking = Booking.new
    @dog = Dog.find(params[:dog_id])
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
    redirect_to dog_path, status: :see_other
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end


# @list = List.find(params[:list_id])
#     @bookmark = Bookmark.new(bookmark_params)
#     @bookmark.list = @list
#     if @bookmark.save
#       redirect_to list_path(@list)
#     else
#       render 'new', status: :unprocessable_entity
#     end
