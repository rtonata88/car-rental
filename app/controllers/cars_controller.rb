# frozen_string_literal: true

class CarsController < ApplicationController
  # GET /cars
  def index
    @cars = Car.all
    render json: @cars
  end

  # GET /cars/1.json
  def show
    @car = Car.find(params[:id])
    render json: @car
  end

  # GET /cars/new
  def new; end

  # GET /cars/1/edit
  def edit; end

  # POST /cars or /cars.json
  def create
    @car = Car.create(
      name: params[:name],
      make: params[:make],
      image: params[:image],
      model: params[:model],
      description: params[:description]
    )
    render json: @car
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    @car = Car.find(params[:id])
    @car.update(
      name: params[:name],
      make: params[:make],
      image: params[:image],
      model: params[:model],
      description: params[:description]
    )
    render json: @car
  end

  def update_car; end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @cars = Car.all
    @car = Car.find(params[:id])
    @car.destroy
    render json: @cars
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car; end

  # Only allow a list of trusted parameters through.
  def car_params; end
end
