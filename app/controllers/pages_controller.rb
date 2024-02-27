class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
  end

  def new
    @car = Car.new
  end
  #creat a new car a faire 
end
