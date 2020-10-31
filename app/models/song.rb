class Song < ApplicationRecord
  belongs_to :video

  #this will index the Song model whenever a record is created or updated or destroyed
  searchkick word_middle: [:title, :lyrics]

  after_commit :reindex_video

  def reindex_video
    video.reindex
  end

end
