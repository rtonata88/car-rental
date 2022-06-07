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
    @favorite = Favorite.create(favorite_params)
    if @favorite.valid?
      render json: @favorite, status: :created
    else
      render json: { errors: @favorite.errors.full_messages },
             status: :not_acceptable
    end
  end

  # DELETE /users/:user_id/favorites/1 or /favorites/1.json
  def destroy
    @favorites = Favorite.all
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    if @favorite.destroyed?
      render json: { message: 'Favorite was destroyed' }, status: :ok
    else
      render json: { errors: @favorite.errors.full_messages },
             status: :not_acceptable
    end
  end

  def favorite_params
    params.permit(:user_id, :car_id)
  end
end
