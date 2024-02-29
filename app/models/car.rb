class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  #validation
  has_rich_text :description

  # geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
