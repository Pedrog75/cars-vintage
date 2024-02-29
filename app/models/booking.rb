class Booking < ApplicationRecord
  attr_accessor :booking_dates
  before_validation :set_dates_from_booking_dates
  belongs_to :car
  belongs_to :user

  private

  def set_dates_from_booking_dates
    return unless booking_dates.present?
    dates_array = booking_dates.split(' to ')
    start_date = dates_array[0]
    end_date = dates_array[1]
    self.start_date = start_date
    self.end_date = end_date
  end
end
