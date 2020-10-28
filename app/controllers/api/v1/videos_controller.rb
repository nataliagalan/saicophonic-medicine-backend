class Api::V1::VideosController < ApplicationController
  def index
    videos = Video.all 
    # render json: videos
    render json: VideoSerializer.new(videos).to_serialized_json

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
