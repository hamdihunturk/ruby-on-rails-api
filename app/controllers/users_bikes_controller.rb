class UsersBikesController < ApplicationController
  before_action :set_users_bike, only: %i[ show update destroy ]

  # GET /users_bikes
  def index
    @users_bikes = UsersBike.all

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


  def QueryMethods
    # Combine two conditions using the [AND] operation in a query
    and_query = UsersBike.where(user_id: 2).and(UsersBike.where(id: 2))

    # Adds a comment "selected all" to the query and selects only the user_id field
    annotate = UsersBike.annotate("selected all").select(:user_id)

    # Selects unique user_id values from the UsersBike table
    distinct = UsersBike.select(:user_id).distinct

    # Eager loads the associated user records for the first 3 UsersBike entries and retrieves their names
    eager_load = UsersBike.eager_load(:user).limit(3)
    names = eager_load.map do |e|
      e.user.name       # Collects the names in an array
    end

    # Retrieves all UsersBike records and extends them with Pagination module for pagination support
    scope = UsersBike.all.extending(Pagination)
    scope.page(params[:page])  # Paginates the records based on the page number from the parameters

    # Selects specified columns from the users table in the UsersBike model
    users = UsersBike.select("id", "name", "surname", "age").from("users")

    # Groups the results by id and name
    group = UsersBike.select("id", "name", "surname", "age").from("users").group(:id, :name)

    # Orders the UsersBike records by id in the specified order: 5, 4, and 1
    in_order_of = UsersBike.in_order_of(:id, [ 5, 4, 1 ])

    includes = UsersBike.select([ :id, :user_id, :bike_id ])

    render json: includes, include: [ :user, :bike ] # ??
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

module Pagination
  def page(number)
    # pagination code goes here
  end
end
