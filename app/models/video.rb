class Video < ApplicationRecord
  belongs_to :user
  has_many :songs
end
