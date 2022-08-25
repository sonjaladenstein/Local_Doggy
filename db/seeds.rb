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



user1 = User.new(
  first_name: Faker::Name.name,
  last_name: Faker::Name.name,
  telephone: Faker::PhoneNumber,
  email: Faker::Internet.email,
  password: Faker::Number.number(digits: 10)
)
user1.save!

user2 = User.new(
  first_name: Faker::Name.name,
  last_name: Faker::Name.name,
  telephone: Faker::PhoneNumber,
  email: Faker::Internet.email,
  password: Faker::Number.number(digits: 10)
)
user2.save!

user3 = User.new(
  first_name: Faker::Name.name,
  last_name: Faker::Name.name,
  telephone: Faker::PhoneNumber,
  email: Faker::Internet.email,
  password: Faker::Number.number(digits: 10)
)
user3.save!

user4 = User.new(
  first_name: Faker::Name.name,
  last_name: Faker::Name.name,
  telephone: Faker::PhoneNumber,
  email: Faker::Internet.email,
  password: Faker::Number.number(digits: 10)
)
user4.save!

user5 = User.new(
  first_name: Faker::Name.name,
  last_name: Faker::Name.name,
  telephone: Faker::PhoneNumber,
  email: Faker::Internet.email,
  password: Faker::Number.number(digits: 10)
)
user5.save!


dog1 = Dog.new(
  name: "Bailey",
  age: Faker::Number.between(from: 1, to: 15),
  description: "Pround adventurous dog that loves hikes",
  location: "carrer de mallorca 133 barcelona",
  user: user1,
  price: Faker::Number.between(from: 5, to: 50),
  picture: "https://th.bing.com/th/id/R.c7e044473c4c69c9ca921a8c1f430c3d?rik=bYQZCg5iCs%2fcEg&riu=http%3a%2f%2fimages6.fanpop.com%2fimage%2fphotos%2f32600000%2fDog-dogs-32691594-1600-1200.jpg&ehk=WWpmbs2eW8g8W%2ftqkJiTC%2bA4lycrKkNssrgCJMhWauw%3d&risl=&pid=ImgRaw&r=0"
  )
  dog1.save!

dog2 = Dog.new(
  name: "Hazel",
  age: Faker::Number.between(from: 1, to: 15),
  description: "Lovely Dog that loves it's treats and being petted",
  location: "gran via de les corts catalanes 724 barcelona",
  user: user2,
  price: Faker::Number.between(from: 5, to: 50),
  picture: "https://www.thesprucepets.com/thmb/As-2AnSopdDBLeE9aytuwWOLBe8=/941x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/cute-teacup-dog-breeds-4587847-hero-4e1112e93c68438eb0e22f505f739b74.jpg"
  )
  dog2.save!

dog3 = Dog.new(
  name: "Pepper",
  age: Faker::Number.between(from: 1, to: 15),
  description: "This is our sleepy dog with a big heart that is very easily distracted",
  location: "carrer de sant ferran 4 cornellà de llobregat barcelona",
  user: user3,
  price: Faker::Number.between(from: 5, to: 50),
  picture: "https://th.bing.com/th/id/R.ea9ab0497d89c9b406ff28b15fc662ae?rik=5fXoOR8FQ5gguQ&riu=http%3a%2f%2fimages6.fanpop.com%2fimage%2fphotos%2f34000000%2fDog-dogs-34087524-1265-848.jpg&ehk=ejxUNfTbvo7gWrEUbIfBBTyzEhPfBkco4HsB0H9%2byc4%3d&risl=&pid=ImgRaw&r=0"
  )
  dog3.save!

dog4 = Dog.new(
  name: "Simba",
  age: Faker::Number.between(from: 1, to: 15),
  description: "Chilled dog that loves hanging out with children",
  location: "carrer de les ciencies 17 barcelona",
  user: user4,
  price: Faker::Number.between(from: 5, to: 50),
  picture: "https://cdn.britannica.com/49/161649-050-3F458ECF/Bernese-mountain-dog-grass.jpg?q=60"
  )
  dog4.save!

dog5 = Dog.new(
  name: "Apollo",
  age: Faker::Number.between(from: 1, to: 15),
  description: "Loves the cold and going to Andorra in the winter",
  location: "carrer antartic 13 barcelona  ",
  user: user5,
  price: Faker::Number.between(from: 5, to: 50),
  picture: "https://tse3.mm.bing.net/th?id=OIP.IitgyH10SCQXv6SA2slRGQHaEo&pid=Api&P=0"
  )
  dog5.save!

dog6 = Dog.new(
  name: "Leyla",
  age: Faker::Number.between(from: 1, to: 15),
  description: "active and curious she loves walks and hikes",
  location: "rambla de prim 146 barcelona",
  user: user5,
  price: Faker::Number.between(from: 5, to: 50),
  picture: "https://www.mybestfrienddogcare.co.uk/wp-content/uploads/2019/12/My-Best-Friend-64-1024x793.jpg"
  )
  dog6.save!

dogs = Dog.all
users = User.all
5.times do
  date = Faker::Date.in_date_period
  booking = Booking.new(
    user: users.sample,
    dog: dogs.sample,
    start_date: date,
    end_date: date + rand(1...6).days
  )
  booking.save!
end
