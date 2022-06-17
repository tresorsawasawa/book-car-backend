class Api::V1::ReservationsController < ApplicationController
  before_action :authorize_request, only: i%[index create destroy]

  def index
    @reservations = current_user.reservetions

    render json: @reservations, status: 200
  end
end
