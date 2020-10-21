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
    # user_id = request.headers[:id]
    user_id = 5
    user = User.find(user_id)
    # user.videos.create creates and returns that video
    video = user.videos.create(video_params)
    # need to create songs as well
    if video.valid?
      render json: VideoSerializer.new(video).to_serialized_json
    else
      render json: { error: 'create error message here' }, status: :not_acceptable
    end
  end

  def update
    video = Video.find(params[:id])
    video.update(video_params)
    if video.valid?
      render json: VideoSerializer.new(video).to_serialized_json, status: :ok
    else
      render json: { error: 'update error message here' }, status: :not_acceptable
    end
  end

  def destroy
    video = Video.find(params[:id])
    begin
      video.songs.destroy_all
      video.destroy
      render json: { message: 'success', status: 200 }
    rescue StandardError
      render json: { error: 'unable to delete' }
    end
  end

  private

  def video_params
    params.require(:video).permit(:url, :user_id)
    # byebug
  end

end #end of vc class
