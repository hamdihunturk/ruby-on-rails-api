class AddsController < ApplicationController
  before_action :set_add, only: %i[ show update destroy ]

  # GET /adds
  def index
    authors = Author.select(:name, :age, :city_id)

    ########################
    # authors = Author.all
    # render json: {
    #   succes: 1,
    #   data: authors.as_json(
    #     include: {
    #         city: {
    #           except: [ :id ]
    #         }
    #       }, except: [ :id ]
    #   ),
    #   message: "" }
    ########################

    ########################
    # authors = Author.select(:name, :age, :city_id)
    # render json: {
    # succes: 1,
    # data: authors.as_json(
    #   include: {
    #     city: {
    #       only: [ :name ]  # Sadece name alanını dahil etmek
    #     }
    #   }
    # ),
    # message: ""
    # }
    ########################


    comment = Comment.includes(:article)
    render json: {
      succes: 1,
      data: comment.as_json(
        include: { article: { include: { author: { include: :city } } } }
      ),
      message: ""
    }
  end

  # GET /adds/1
  def show
    render json: @add
  end

  # POST /adds
  def create
    @add = Add.new(add_params)

    if @add.save
      render json: @add, status: :created, location: @add
    else
      render json: @add.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /adds/1
  def update
    if @add.update(add_params)
      render json: @add
    else
      render json: @add.errors, status: :unprocessable_entity
    end
  end

  # DELETE /adds/1
  def destroy
    @add.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add
      @add = Add.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def add_params
      params.fetch(:add, {})
    end
end
