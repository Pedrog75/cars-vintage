class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @cars = current_user.cars
    @recent_bookings = current_user.bookings || [] # Initialisation avec une liste vide si aucun booking n'est associé à l'utilisateur
    @cars_and_bookings = (@cars + @recent_bookings).sort_by(&:created_at).reverse
  end


end
