class Video < ApplicationRecord
  belongs_to :user
  has_many :songs

  searchkick word_middle: [:songs]

  scope :search_import, -> { includes(:songs) }


  def search_data
    attributes.merge(
      songs_data: songs
      # song_title: songs(&:title)
      #You use the .map method for the has_many associations.
      # subject_name: subjects.map(&:name)
    )
  end

end
