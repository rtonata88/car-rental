class ApplicationController < ActionController::API
  SECRET = '_car_rental'.freeze

  def not_found
    render json: { error: 'not_found' }
  end

  # decode(token, key)
  def authorize_request
    if request.headers['Authorization']
      encoded_token = request.headers['Authorization']
      token = JWT.decode(encoded_token, SECRET)
      current_user_id = token[0]['user_id']
      @current_user = User.find(current_user_id)
      @requested_user = User.find(params[:user_id])
      if @current_user == @requested_user
        true
      else
        render json: { error: 'invalid credentials' }
      end
    else
      render json: { error: 'unauthorized access' }
    end
  end
end
