class UsersController < ApplicationController
  # # GET /users
  # def index
  #   @users = User.all 
  #   render json: @users
  # end

  # GET /users/1.json
  # def show
  #   @user = User.find(params[:id])
  #   render json: @user
  # end

  # GET /users/new
  # def new
  # end

  # GET /users/1/edit
  # def edit
  # end

  # POST /users
  # body: { :username, :password}
  def create
    @user = User.create(user_params)
    if @user.valid?
        token = JWT.encode({user_id: @user.id}, SECRET, 'HS256')
        render json: {user: @user, token: token}
    else
        render json: {status: 500, errors: @user.errors.full_messages}
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  # def update
  #   @user = User.find(params[:id])
  #   @user.update(
  #     username: params[:username],
  #   )
  #   render json: @user
  # end

  # def update_car
  # end

  # DELETE /cars/1 or /cars/1.json
  # def destroy
  #   @users = User.all
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   render json: @users
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_user
  # end

  # Only allow a list of trusted parameters through.
  def user_params
    params.permit(:username, :password)
  end
end
