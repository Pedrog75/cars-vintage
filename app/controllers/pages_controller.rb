class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home, :cars
  def home
  end
end
