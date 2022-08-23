# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
Booking.destroy_all
Dog.destroy_all
User.destroy_all


5.times do
  user = User.new(
    first_name: Faker::Name.name,
    last_name: Faker::Name.name,
    telephone: Faker::PhoneNumber,
    email: Faker::Internet.email,
    password: Faker::Number.number(digits: 10)
  )
  user.save!

  dog = Dog.new(
  name: Faker::Name.name,
  age: Faker::Number.between(from: 1, to: 15),
  description: Faker::Marketing.buzzwords,
  location: Faker::Address.city,
  user: user,
  price: Faker::Number.between(from: 5, to: 50)
  )
  dog.save!

end

dogs = Dog.all
users = User.all
25.times do
  date = Faker::Date.in_date_period
  booking = Booking.new(
    user: users.sample,
    dog: dogs.sample,
    start_date: date,
    end_date: date + rand(1...6).days
  )
  booking.save!
end
