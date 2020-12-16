class Api::V1::VideosController < ApplicationController

  def index
    videos = Video.paginate(page: params[:page], per_page: Video.videos_per_page)
    render json: VideoSerializer.new(videos).to_serialized_json
  end

  #GET /videos/search/:query
  def search
    elastic_query = {
      # operator: "or", 
      fields: [{"band^100" => :text_middle,}, 
      {"song_title^100" => :text_middle,}, 
      {"song_lyrics^60" => :text_middle,},
      {"tagged^50" => :text_middle,}], 
      fields: ["band^100", "song_title^100", "song_lyrics^70", "tagged^50" ], 
      # misspellings: {below: 1, edit_distance: 1}, 
      order: {_score: :desc},
      # debug: true
      misspellings: false,
      # optional where clause example to only search records returned by other filters
      # where: { id: listings_ids },
      # page: params[:page],
      # per_page: 8
    }
    videos = Video.search(params[:query], elastic_query)
    if response
      render json: VideoSerializer.new(videos).to_serialized_json
    else
      render json: { error: 'did not find anything' }
    end
  end

  #GET /videos/tagged/:tag
  def search_tagged
    elastic_query = {
      operator: "or", 
      fields: [{"tagged^100" => :text_middle,}], 
      misspellings: {below: 1, edit_distance: 1}, 
      order: {_score: :desc}
    }
    videos = Video.search(params[:tag], elastic_query)
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
    # user_id = request.headers["id"]
    # user = User.find(user_id)
    # user = User.find(2)
    # user.videos.create creates and returns that new video
    # video = user.videos.create(video_params)
    # video = user.videos.create(url: params["url"], band: params["band"], user_id: 2)
    video = Video.create(url: params["url"], band: params["band"], user_id: 2)
    # if video.valid?
      # params["songs"].each{|song| video.songs.create(timestamp: song["timestamp"], title: song["title"], lyrics: song["lyrics"], video_id: video.id) } 
      # if params["tags"]
      #   params["tags"].each do |tag| 
      #     tag_id = Tag.find_or_create_by({name: tag}).id 
      #     VideoTag.find_or_create_by({ tag_id: tag_id, video_id: video.id })  
      #   end
      # end
      render json: VideoSerializer.new(video).to_serialized_json, status: :ok
    # else
      # render json: { error: 'could not create new video' }
    # end
  end # end of create action

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
      video.video_tags.each do |video_tag|
        video_tag.destroy
      end
      params["tags"].each do |tag| 
        tag_id = Tag.find_or_create_by({name: tag["name"]}).id 
        VideoTag.find_or_create_by({ tag_id: tag_id, video_id: video.id })  
      end
      render json: VideoSerializer.new(video).to_serialized_json, status: :ok
    else
      render json: { error: 'could not update video info' }, status: :not_acceptable
    end
  end # end of update action

  def destroy
    video = Video.find(params[:id])
    begin
      video.songs.destroy_all
      video.video_tags.destroy_all
      video.destroy
      render json: { message: 'great success', status: 200 }
    rescue StandardError
      render json: { error: 'could not delete' }
    end
  end

  def random
    id = Video.all.ids.sample
    video = Video.find(id)
    render json: VideoSerializer.new(video).to_serialized_json
  end

  # private

  # def video_params
  #   params.require(:video).permit(:url, :band, :user_id)
  # end

end #end of vc class
