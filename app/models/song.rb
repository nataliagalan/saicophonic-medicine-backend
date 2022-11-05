require 'elasticsearch/model'

class Song < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  settings index: { number_of_shards: 1 }
  
  belongs_to :video
  validates :lyrics, :title, :timestamp, presence: true

  #this will index the Song model whenever a record is created or updated or destroyeddd
  searchkick text_middle: [:title, :lyrics]

  after_commit :reindex_video

  def reindex_video
    video.reindex
  end

end
