class Api::V1::AuthController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      #send user to FE
      render json: user

    else
      render json: { error: 'user or pw invalid' }
    end

  end #end of create action

end #end of ac
