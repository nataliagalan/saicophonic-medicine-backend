class Api::V1::VideosController < ApplicationController
  def index
    videos = Video.all 
    # render json: videos
    render json: VideoSerializer.new(videos).to_serialized_json
  end

  # class << self
  #   def query(params)
  #     listings = self.active_record_search(params) # filter by other parameters first
  
  #     # return right there if search is blank
  #     return listings.page(params[:page]) if params[:search].blank?
  
  #     # otherwise pass already filtered set to elastic search for further filtering
  #     listing_ids = listings.pluck(:id)
  #     self.elastic_search(params, listing_ids)
  #   end
  
  #   def active_record_search(params)
  #     # ...some code
  #   end
  
  #   def elastic_search(params, listing_ids)
  #     elastic_query = {

  #       fields: [:song_title, :song_lyrics],
  #     }
  
  #     self.search(params[:search], elastic_query)
  #   end
  # end


  #GET /search/:query
  def search
    elastic_query = {
      # fields: [:title, :description, :tagged, :artist_name],
      fields: [:song_title, :song_lyrics],
      misspellings: {edit_distance: 2}
      # include a where clause so I'm only searching records returned by the other filters
      # where: { id: listings_ids },
      # order: { _score: :desc },
      # page: params[:page],
      # per_page: 15
    }


    videos = Video.search params[:query], elastic_query
    
    # videos = Video.search params[:query], misspellings: {edit_distance: 2}
    puts "TOTAL COUNT #{videos.total_count }"
    if response
    # render :json => videos.to_json
    render json: VideoSerializer.new(videos).to_serialized_json
    else
    render json: { error: 'did not find anything' }
    end
  end



  def show
    video = Video.find(params[:id])
    render json: VideoSerializer.new(video).to_serialized_json
  end

  def create
    user_id = request.headers[:id]
    user = User.find(user_id)
    # user.videos.create creates and returns that new video
    video = user.videos.create(video_params)
    # possibly move the create songs to inside the if statement
    params["songs"].each{|song| video.songs.create(timestamp: song["timestamp"], title: song["title"], lyrics: song["lyrics"], video_id: video.id) } 
    if video.valid?
      render json: VideoSerializer.new(video).to_serialized_json
    else
      render json: { error: 'could not create new video' }, status: :not_acceptable
    end
  end

  def update
    video = Video.find(params[:id])
    video.update(video_params)
    if video.valid?
      video.songs.each do |video_song|
        video_song.destroy
      end

      params["songs"].each do |song| 
        Song.create(timestamp: song["timestamp"], title: song["title"], lyrics: song["lyrics"], video_id: video.id) 
      end

      render json: VideoSerializer.new(video).to_serialized_json, status: :ok
    else
      render json: { error: 'could not update video info' }, status: :not_acceptable
    end
  end

  def destroy
    video = Video.find(params[:id])
    begin
      video.songs.destroy_all
      video.destroy
      render json: { message: 'success', status: 200 }
    rescue StandardError
      render json: { error: 'could not delete' }
    end
  end

  private

  def video_params
    params.require(:video).permit(:url, :user_id)
  end

end #end of vc class
