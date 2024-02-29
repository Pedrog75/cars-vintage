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


User.create(
  email: "test@test.com",
  password: "azerty"
)
User.create(
  email: "johndoe@example.com",
  password: "password"
)

Car.delete_all

categories = ['Citadine', 'Familiale', 'SUV', 'Sportive']

20.times do
  description = "<ul>"
  rand(3..5).times do
    description << "<li>#{Faker::Vehicle.standard_specs.sample}</li>"
  end
  description << "</ul>"
  car = Car.create(
    name: Faker::Vehicle.make_and_model,
    category: categories.sample,
    description: description,
    price: (rand(10) + 1) * 50,
    user_id: User.first.id
  )

  file = URI.open("https://source.unsplash.com/random/?car-#{Time.current.seconds_since_midnight}")
  car.photo.attach(io: file, filename: "car.png", content_type: "image/png")
end
