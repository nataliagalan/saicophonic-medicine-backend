class Video < ApplicationRecord
  belongs_to :user
  has_many :songs

  #validations go here too!
  
  #remember to always reindex after making changes below here
  #this will index the Song model whenever a record is created or updated or destroyed
  scope :search_import, -> { includes(:songs) }
  searchkick text_middle: [:band, :song_title, :song_lyrics]
  
  #keys inside search_data describe how the data is indexed
  def search_data
    { 
      # song_title: songs.map(&:title),
      band: band,
      song_title: "#{songs.map(&:title).join(' ')}",
      song_lyrics: "#{songs.map(&:lyrics).join(' ')}"
      # tagged: "#{tags.map(&:name).join(' ')}" 
    }

    #I think attributes.merge makes it so attributes are not nested under "_source"
    # attributes.merge(
    #   #You use the .map method for the has_many associations.
    #   song_title: songs.map(&:title),
    #   song_lyrics: songs.map(&:lyrics)
    # )
  end

end


