# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
require "open-uri"
Booking.delete_all
Car.delete_all


User.create(
  email: "johndoe@example.com",
  password: "password"
)

10.times do
  car = Car.create(
    name: Faker::Vehicle.make_and_model,
    category: Faker::Vehicle.version,
    description: Faker::Vehicle.standard_specs,
    address: Faker::Address.full_address,
    price: (rand(10) + 1) * 50,
    user_id: User.first.id
  )

  file = URI.open("https://source.unsplash.com/random/?car-#{Time.current.seconds_since_midnight}")
  car.photo.attach(io: file, filename: "car.png", content_type: "image/png")
end
