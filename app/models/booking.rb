class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user
  #validation
  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_before_start_date
  # validate :start_date_cannot_be_after_end_date

  private

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if start_date.present? && start_date < Date.today
  end

  def end_date_cannot_be_before_start_date
    errors.add(:end_date, "can't be before start date") if start_date.present? && end_date.present? && end_date < start_date
  end
  # if start_date.present? && end_date.present? && start_date > end_date
  #   errors.add(:start_date, "can't be after end date")
  # end
end
