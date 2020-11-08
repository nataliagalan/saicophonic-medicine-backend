class Api::V1::VideosController < ApplicationController
  def index
    videos = Video.all.reverse 
    render json: VideoSerializer.new(videos).to_serialized_json
  end

  #GET /search/:query
  def search
    elastic_query = {
      operator: "or", 
      fields: [{"band^100" => :text_middle,}, 
      {"song_title^100" => :text_middle,}, 
      {"song_lyrics^70" => :text_middle,},
      {"tagged^50" => :text_middle,}], 
      fields: ["band^100", "song_title^100", "song_lyrics^70", "tagged^50" ], 
 
      misspellings: {below: 1, edit_distance: 1}, 
      order: {_score: :desc}
      # debug: true

    #   misspellings: false,
    #   include a where clause so I'm only searching records returned by the other filters
    #   where: { id: listings_ids },
    #   page: params[:page],
    #   per_page: 15
    }

    videos = Video.search(params[:query], elastic_query)

    if response
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
    
    # byebug
    # params["tags"].split(', ').each do |tag|
    #   tag_id = Tag.find_or_create_by({name: tag}).id
    #   VideoTag.create({"tag_id": tag_id, "video_id": video.id})
    # end
    
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

  def random
    id = Video.all.ids.sample
    video = Video.find(id)
    render json: VideoSerializer.new(video).to_serialized_json
  end

  private

  def video_params
    params.require(:video).permit(:url, :band, :user_id)
  end

end #end of vc class
