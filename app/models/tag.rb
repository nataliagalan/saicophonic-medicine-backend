class Tag < ApplicationRecord
  has_many :video_tags
  has_many :videos, through: :video_tags

  #this will index the Tag model whenever a record is created or updated or destroyed
  searchkick text_middle: [:name]
end
