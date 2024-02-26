# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# require 'faker'
# 10.times do
#   User.create(
#     email: Faker::Internet.email,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     address: Faker::Address.full_address,
#     phone_number: Faker::PhoneNumber.phone_number
# )
# end

# 10.times do
#   Car.create(
#     name: Faker::Vehicle.make_and_model,
#     category: Faker::Vehicle.version,
#     description: Faker::Vehicle.standard_specs,
#     price: 100,
#     user_id: user.id,
#   )
# end
