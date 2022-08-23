class PagesController < ApplicationController
  def home
    @dogs = Dog.all.sample(3)
  end
end
