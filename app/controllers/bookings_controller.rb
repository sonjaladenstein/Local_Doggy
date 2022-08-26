class BookingsController < ApplicationController
  def index
    @booking = Booking.all
  end

  def create
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new(bookings_params)

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
    # # @array_single_dog = []
    # # @array_single_dog << @booking.dog
    # @markers = @booking.dog.geocode.map do |dog|
    #   {
    #     lat: dog.latitude,
    #     lng: dog.longitude,

    #     info_window: render_to_string(partial: "info_window", locals: {dog: dog})
    #   }
    # end
    @dog = Dog.find(params[:dog_id])
    @markers = [{ lat: @dog.geocode[0], lng: @dog.geocode[1] }]
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
