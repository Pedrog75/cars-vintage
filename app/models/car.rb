class Car < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  #validation
  has_rich_text :description

pg_search_scope :search_by_name_and_description,
  against: [ :name, :description ],
  using: {
    tsearch: { prefix: true }
  }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
