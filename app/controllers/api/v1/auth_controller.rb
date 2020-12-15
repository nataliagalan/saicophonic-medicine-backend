class Api::V1::AuthController < ApplicationController
  
  #logs in admin. encode_token method comes from application_controller.rb
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      payload = { user_id: user.id }
      token = encode_token(payload)
      #sends user to FE
      render json: { id: user.id, username: user.username, token: token }
    else
      render json: { error: 'invalid username or password' }
    end
  end #end of create action

  # current_user method comes from application_controller.rb
  # validates admin token
  def show
    if current_user
      render json: { id: @user.id, username: @user.username, token: @token }
    else
      render json: { error: 'invalid token' }
    end
  end #end of show action

end #end of ac
