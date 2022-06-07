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

  # POST /cars or /cars.json
  def create
    @car = Car.create(car_params)
    render json: @car
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    render json: @car
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @cars = Car.all
    @car = Car.find(params[:id])
    @car.destroy
    render json: @cars
  end

  private

  # Only allow a list of trusted parameters through.
  def car_params  
    params.permit(:name, :make, :image, :model, :description)
  end
end
