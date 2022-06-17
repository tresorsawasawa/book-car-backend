class Api::V1::ReservationsController < ApplicationController
  before_action :authorize_request, only: %i[index create destroy]


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

  def destroy
    reservation = User.find(@current_user.id).reservations.find(params[:id]).destroy!

    render json: { data: reservation, message: ['reservation deleted'] }, status: :ok if reservation.destroyed?
  rescue StandardError => e
    render json: { error: 'not found', error_message: ["Reservation not found #{e}"] }, status: :not_found
  end

  private

  def reservation_params
    params.require(:reservation).permit(:pick_up_day, :return_day, :pick_up_city, :return_city, :car_id)
  end
end
