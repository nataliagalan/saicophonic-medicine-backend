class RemoveLyricsFromVideos < ActiveRecord::Migration[6.0]
  def change
    remove_column :videos, :lyrics, :string
  end
end
