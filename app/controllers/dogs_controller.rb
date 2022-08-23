class DogsController < ApplicationController
  def index
    @dogs = Dog.all
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
    params.require(:dog).permit(:name, :description, :age, :location)
  end
end
