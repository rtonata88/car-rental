class AuthController < ApplicationController
  # encode(token, key, algorithm)
  def login
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      token = JWT.encode({ user_id: @user.id }, SECRET, 'HS256')
      render json: { user: @user, token: token }
    else
      render json: { error: 'username or password are invalid' }
    end
  end
end
