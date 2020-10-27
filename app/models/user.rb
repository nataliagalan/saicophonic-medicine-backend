class User < ApplicationRecord
  has_many :videos
  
  has_secure_password
end
