class FavoritesController < ApplicationController
  before_action :authorize_request

  # GET  /users/:user_id/favorites
  def index
    @user = User.find(params[:user_id])
    @favorites = Favorite.includes(:user).where(user_id: @user.id)
    render json: @favorites
  end

  # POST /users/:user_id/favorites or /favorites.json
  # { body: :car_id }
  def create
    @favorite = Favorite.create(
      user_id: params[:user_id],
      car_id: params[:car_id]
    )
    render json: @favorite
  end

  # DELETE /users/:user_id/favorites/1 or /favorites/1.json
  def destroy
    @favorites = Favorite.all
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    render json: @favorites
  end
end
