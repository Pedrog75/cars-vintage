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
require 'nokogiri'

Booking.delete_all
Car.delete_all


class ParisAddressGenerator
  class << self
    def generate(attr = {})
      new(attr).generate
    end
  end

  def initialize(attr = {})
    @nb = attr[:number] || 20
    @filepath = attr[:filepath] || "#{`pwd`.strip}/addresses.txt"
  end

  def generate
    streets = random_addresses
    write_file(streets)
  end

  private

  def random_addresses
    url = "https://www.generatormix.com/random-address-in-paris?number=#{@nb}"
    doc = Nokogiri::HTML(URI.open(url).read)
    selector = 'p.text-left strong:contains("Street:")'
    doc.css(selector).map do |strong_tag|
      strong_tag.parent.text.gsub(/Street:/, "").strip
    end
  end

  def write_file(streets)
    File.open(@filepath, 'w') do |file|
      streets.each { |street| file.write("#{street}\n") }
    end
  end
end



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

addresses = []

20.times do
  sleep 1
  geocoder_result = Geocoder.search("#{ParisAddressGenerator.generate(number: 1)}, Paris, France").first.data

  addresses << {
    address: geocoder_result["display_name"],
    longitude: geocoder_result["lon"],
    latitude: geocoder_result["lat"]
  }
end

20.times do |index|
  description = "<ul>"
  rand(3..5).times do
    description << "<li>#{Faker::Vehicle.standard_specs.sample}</li>"
  end
  description << "</ul>"
  car = Car.create(
    name: Faker::Vehicle.make_and_model,
    category: categories.sample,
    description: description,
    address: addresses[index][:address],
    longitude: addresses[index][:longitude],
    latitude: addresses[index][:latitude],
    price: (rand(10) + 1) * 50,
    user_id: User.first.id
  )

  file = URI.open("https://source.unsplash.com/random/?car-#{Time.current.seconds_since_midnight}")
  car.photo.attach(io: file, filename: "car.png", content_type: "image/png")
end
