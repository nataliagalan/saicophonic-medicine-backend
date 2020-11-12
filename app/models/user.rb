class User < ApplicationRecord
  has_many :videos
  validates :username, :password_digest, presence: true
  
  has_secure_password
end
