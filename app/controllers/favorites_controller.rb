class FavoritesController < ApplicationController
  before_action :authorize_request

  # GET  /users/:user_id/favorites
  def index
    @user = User.find(params[:user_id])
    @favorites = Favorite.includes(:user).where(user_id: @user.id)

    if @favorites
      render json: @favorites
    else
      render json: { error: @favorites.errors, status: :unprocessable_entity }
    end
  end

  # POST /users/:user_id/favorites or /favorites.json
  # { body: :car_id }
  def create
    @favorite = Favorite.create(
      user_id: params[:user_id],
      car_id: params[:car_id]
    )
      if @favorite.save
        render json: @favorite, status: :created, message: 'Favorite was successfully created.'
      else
        render json: { error: @favorite.errors, status: :unprocessable_entity }
      end 
  end

  # DELETE /users/:user_id/favorites/1 or /favorites/1.json
  def destroy
    @favorites = Favorite.all
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    
    unless @favorite.in?(@favorites)
      render json: { status: :success, message: "Favorite destroyed!" }
    else
      render json: { status: :failure, error: "Could not find favorite to destroy" }
    end
  end
end
