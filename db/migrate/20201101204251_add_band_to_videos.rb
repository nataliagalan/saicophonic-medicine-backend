class AddBandToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :band, :string
  end
end
