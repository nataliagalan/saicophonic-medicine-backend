class Api::V1::VideosController < ApplicationController
  def index
    videos = Video.all 
    render json: videos
  end

  def show
    video = Video.find(params[:id])
    render json: video
  end

  def create
    # user_id = request.headers[:id]
    user_id = 2
    user = User.find(user_id)
    video = user.videos.create(video_params)
    if video.valid?
      render json: video
    else
      render json: { error: 'create error message here' }, status: :not_acceptable
    end
  end

  def update
    video = Video.find(params[:id])
    video.update(video_params)
    if video.valid?
      render json: video, status: :ok
    else
      render json: { error: 'update error message here' }, status: :not_acceptable
    end
  end

  def destroy
    video = Video.find(params[:id])
    begin
      video.destroy
      render json: { message: 'success', status: 200 }
    rescue StandardError
      render json: { error: 'unable to delete' }
    end
  end

  private

  def video_params
    params.require(:video).permit(:url, :lyrics, :user_id)
    # byebug
  end

end #end of vc class
