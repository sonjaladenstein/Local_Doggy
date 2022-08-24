class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.save!
    redirect_to bookings_path
  end
  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :booking_id)
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
