class ApplicationController < ActionController::API

  def encode_token(payload)
    JWT.encode(payload, ENV['jwt_secret'], 'HS256')
  end

  def auth_header
    request.headers['Authorization']
  end

  # The Begin/Rescue syntax allows us to rescue out of an exception in Ruby, 
  # in the event our server receives and attempts to decode an invalid token
  # If our server receives a bad token, this will raise an exception causing a 500 Internal Server Error. 
  # We can account for this by rescuing out of this exception. Instead of crashing our server, we simply return nil.
  def decoded_token
    if auth_header
      # The auth header follows the  Bearer schema -> headers: { 'Authorization': 'Bearer <token>' }
      @token = auth_header.split(' ')[1]
      begin
        JWT.decode(@token, ENV['jwt_secret'], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end
  
  def current_user
    if decoded_token
      # decoded_token=> [{"user_id"=>2}, {"alg"=>"HS256"}]
      # or nil if we can't decode the token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

end #end of ac
