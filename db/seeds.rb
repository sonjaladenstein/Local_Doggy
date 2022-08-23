# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"


5.times do
  user = User.new(
    first_name: Faker::Name,
    last_name: Faker::Name,
    telephone: Faker::PhoneNumber,
    email: Faker::Internet.email,
    password: Faker::Number.number(digits: 10)
  )
  user.save!

  dog = Dog.new(
  name: Faker::Name,
  age: Faker::Number.between(from: 1, to: 15),
  description: Faker::Marketing.buzzwords,
  location: Faker::Address.city,
  user: user
  )
  dog.save!
end
