class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @cars = Car.all
    if params[:search].present?
      @cars = @cars.where("name LIKE :search OR category LIKE :search OR price::text LIKE :search", search: "%#{params[:search]}%")
    end

    if params[:category].present?
      @cars = @cars.where("category LIKE ?", "%#{params[:category]}%")
    end

    if params[:price].present?
      @cars = @cars.where("price::text LIKE ?", "%#{params[:price]}%")
    end
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
  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to dashboard_path
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private
  def car_params
    params.require(:car).permit(:name, :category, :description, :price, :user_id, :photo)
  end
end
