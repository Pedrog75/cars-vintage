class Car < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  #validation
  has_rich_text :description
end
