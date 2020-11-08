class VideoTag < ApplicationRecord
  belongs_to :video
  belongs_to :tag

  #this will index the VideoTag model whenever a record is created or updated or destroyed
  searchkick

  after_commit :reindex_video

  def reindex_video
    video.reindex
  end

end
