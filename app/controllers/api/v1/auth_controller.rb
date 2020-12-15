class Api::V1::AuthController < ApplicationController
  
  def create
    
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      payload = { user_id: user.id }
      token = JWT.encode(payload, ENV['jwt_secret'], 'HS256')
      #send user to FE
      render json: { id: user.id, username: user.username, token: token }
    else
      render json: { error: 'user or pw invalid' }
    end
  end #end of create action

  def show
    # byebug
    token = request.headers['Authorization'].split(' ')[1]
    # token = request.headers[:Authorization]
    # decoded_token = JWT.decode(token, ENV['jwt_secret'], true, { algorithm: 'HS256'})
    decoded_token = JWT.decode(token, 'S3k3R3T', true, { algorithm: 'HS256'})
    user_id = decoded_token[0]['user_id']
    user = User.find(user_id)
    if user
      render json: { id: user.id, username: user.username, token: token }
    else
      render json: { error: 'invalid token' }
    end
  end #end of show action

end #end of ac
