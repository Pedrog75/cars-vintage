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
  def create
    @car = Car.new(car_params)
    @car.save
    redirect_to dashboard_path
  end

  private
  def car_params
    params.require(:car).permit(:name, :category, :description, :price, :user_id)
  end
end
