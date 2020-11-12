class Video < ApplicationRecord
  default_scope {order(created_at: :desc)}

  belongs_to :user
  has_many :songs
  has_many :video_tags
  has_many :tags, through: :video_tags

  validates :url, :band, presence: true
  
  #remember to always reindex after making changes below here
  #this will index the Song model whenever a record is created or updated or destroyed
  scope :search_import, -> { includes(:songs, :tags) }

  searchkick text_middle: [:band, :song_title, :song_lyrics, :tagged]

  
  #keys inside search_data describe how the data is indexed
  def search_data
    { 
      # song_title: songs.map(&:title),
      band: band,
      song_title: "#{songs.map(&:title).join(' ')}",
      song_lyrics: "#{songs.map(&:lyrics).join(' ')}",
      tagged: "#{tags.map(&:name).join(', ')}" 
    }

  end

  def self.videos_per_page
    8
  end


  def number_of_pages
    (Video.all.count.to_f / Video.videos_per_page).ceil
  end





end #end of video class


