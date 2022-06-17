class Api::V1::ReservationsController < ApplicationController
  before_action :authorize_request, only: i%[index create destroy]

  def index
    @reservations = current_user.reservetions

    render json: @reservations, status: 200
  end

  def create
    @reservation = current_user.reservetions.new(reservation_params)

    if @reservation.save
      render :create, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:pick_up_day, :return_day, :pick_up_city, :return_city, :car_id)
  end
end
