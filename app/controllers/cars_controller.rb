class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @categories = ['Citadine', 'Familiale', 'SUV', 'Sportive']
    @cars = Car.all
    if params[:search].present?
      @cars = @cars.search_by_name_and_description(params[:search])
    end

    if params[:category].present?
      @cars = @cars.where("category LIKE ?", "%#{params[:category]}%")
    end

    if params[:price_from].present?
      @cars = @cars.where("price >= ?", params[:price_from].to_i)
    end

    if params[:price_to].present?
      @cars = @cars.where("price <= ?", params[:price_to].to_i)
    end
    @markers = @cars.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new(car: @car) # Initialiser une nouvelle réservation pour cette voiture
    @markers = [{ lat: @car.latitude, lng: @car.longitude }]
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user

    if @car.save
      redirect_to dashboard_path, notice: "Car successfully "
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:car).permit(:name, :category, :description, :price, :address, :photo)
  end
end
