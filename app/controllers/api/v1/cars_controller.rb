class Api::V1::CarsController < ApplicationController
  def index
    @cars = Car.all

    render json: @cars, status: 200
  end

  def show
    @car = Car.find(params[:id])

    render json: @car, status: 200
  end

  def create
    @car = current_user.cars.new(car_params)

    if @car.save
      render :create, status: 201
    else
      render json: @car.errors, status: 422
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    head 204
  end

  def car_params
    params.require(:car).permit(:car_model, :price_per_day, :description, :photo, :car_type, :transmission)
  end
end
