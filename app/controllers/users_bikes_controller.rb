class UsersBikesController < ApplicationController
  before_action :set_users_bike, only: %i[ show update destroy ]

  # GET /users_bikes
  def index
    #  @users_bikes = UsersBike.all
    @users_bikes = UsersBike.select(:user_id).where(id: 1).include

    render json: @users_bikes
  end

  # GET /users_bikes/1
  def show
    @find_user_bike =  UsersBike.where(user_id: params[:id]).select(:user_id, :id)
    # @find_user_bike =  UsersBike.where(user_id: params[:id]).where.not(bike_id: 1)
    # render json: @find_user_bike, except: [ :user_id, :bike_id ], include: [ :user, :bike ]
    render json: @find_user_bike
  end

  # POST /users_bikes
  def create
    @users_bike = UsersBike.new(users_bike_params)

    if @users_bike.save
      render json: @users_bike, status: :created, location: @users_bike
    else
      render json: @users_bike.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users_bikes/1
  def update
    if @users_bike.update(users_bike_params)
      render json: @users_bike
    else
      render json: @users_bike.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users_bikes/1
  def destroy
    @users_bike.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_bike
      @users_bike = UsersBike.find_by(user_id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def users_bike_params
      params.require(:users_bike).permit(:user, :bike)
    end
end
