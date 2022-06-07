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
      if car.valid?
      render json: {name: name}, status: :created
    else
      render json: {errors: car.errors.full_messages}, 
      status: :not_acceptable
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    if @car.update(car_params)
        format.json { render :show, status: :ok }
      else
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @cars = Car.all
    @car = Car.find(params[:id])
    @car.destroy
    if car.destroyed?
      render json: {name: name}, status: :destroyed
    else
      render json: {errors: @car.errors.full_messages}, 
      status: :not_acceptable
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def car_params  
    params.permit(:name, :make, :image, :model, :description)
  end
end
