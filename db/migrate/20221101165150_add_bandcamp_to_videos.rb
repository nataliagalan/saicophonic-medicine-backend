class AddBandcampToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :bandcamp, :string
  end
end
