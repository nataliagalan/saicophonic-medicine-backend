class VideoSerializer
 
  def initialize(video_object)
    @video = video_object
  end
 
  def to_serialized_json
    options = {
      include: {
        songs: {
          only: [:lyrics, :timestamp, :title, :video_id]
        },
        tags: {
          only: [:name, :id]
        }
      },
      methods: :number_of_pages,
      except: [:updated_at, :created_at],
    }

    @video.to_json(options)
  end

end #end of vs
