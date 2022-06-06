# frozen_string_literal: true

class UsersController < ApplicationController
  # POST /users
  # body: { :username, :password}
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = JWT.encode({ user_id: @user.id }, SECRET, 'HS256')
      render json: { user: @user, token: }
    else
      render json: { status: 500, errors: @user.errors.full_messages }
    end
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.permit(:username, :password)
  end
end
