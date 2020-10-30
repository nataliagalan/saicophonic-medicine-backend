class Song < ApplicationRecord
  belongs_to :video

  searchkick word_middle: [:title, :lyrics]

  after_commit :reindex_video

  def reindex_video
    video.reindex
  end

end
