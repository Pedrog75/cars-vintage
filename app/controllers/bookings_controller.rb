class BookingsController < ApplicationController
before_action :set_car, only: [:new, :create, :update, :destroy]
before_action :set_booking, only: [:edit, :update, :destroy]

  def new
    @booking = Booking.new
  end


  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path(@car), notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @booking = Booking.find(params[:id])
  end


  def update
    if @booking.update(booking_params)
      redirect_to dashboard_path, notice: 'Booking was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

    def destroy
      @booking.destroy
      redirect_to dashboard_path, notice: 'Booking was successfully destroyed.'
    end


  private

    def set_car
      @car = Car.find(params[:car_id])
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:start_date, :end_date)
    end
end
