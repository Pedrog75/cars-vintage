class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end
  def new
    @car = Car.new
  end
  #creat a new car a faire 

end
