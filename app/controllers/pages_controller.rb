class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @cars = current_user.cars
    @recent_bookings = current_user.bookings
  end
end
