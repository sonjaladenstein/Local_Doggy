class DogsController < ApplicationController
  def index
    @dogs = Dog.all
    @markers = @dogs.geocoded.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude,
        info_window: render_to_string(partial: "info_window", locals: {dog: dog})
      }
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dogs_params)
    @dog.user = current_user
    @dog.save!
    redirect_to dogs_path
  end

  private

  def dogs_params
    params.require(:dog).permit(:name, :description, :age, :location, :photo, :price)
  end
end
