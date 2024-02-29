class Car < ApplicationRecord
  include PgSearch::Model
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  #validation
  has_rich_text :description

pg_search_scope :search_by_name_and_description,
  against: [ :name, :description ],
  using: {
    tsearch: { prefix: true }
  }
end
