class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :update, :destroy]

  # GET /reservations
  def index
    if !params[:date_start].blank? && !params[:date_end].blank?
      @reservations = Reservation.include_user_by_day(params[:date_start], params[:date_end])
    else
      @reservations = Reservation.include_user
    end

    render json: @reservations
  end

  # GET /reservations/1
  def show
    render json: @reservation
  end

  # POST /reservations
  def create
    begin
      User.transaction do
        @user = User.find_or_create_by(id_number: params[:id_number])
        @user.name = params[:name]
        @user.cellphone = params[:cellphone]
        @user.email = params[:email]

        if @user.save
          @reservation = Reservation.new({
             user_id: @user.id,
             movie_id: params[:movie_id]
          })
          if @reservation.save
            render json: {user: @user, reservation: @reservation}, status: :created, location: @reservation
          else
            render json: @reservation.errors, status: :unprocessable_entity
          end
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    rescue
      render json: ["Se ha presentado un error. Intentelo de nuevo"], status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

end
