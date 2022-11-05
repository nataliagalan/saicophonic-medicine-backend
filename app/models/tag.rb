require 'elasticsearch/model'

class Tag < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  settings index: { number_of_shards: 1 }
  
  has_many :video_tags
  has_many :videos, through: :video_tags

  #this will index the Tag model whenever a record is created or updated or destroyed
  searchkick text_middle: [:name]
end
