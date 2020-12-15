class User < ApplicationRecord
  has_many :videos
  validates :username, :password, presence: true
  
  has_secure_password
end
