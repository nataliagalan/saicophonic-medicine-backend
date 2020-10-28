class ChangeDataTypeForTimestamps < ActiveRecord::Migration[6.0]
  def change
    change_column(:songs, :timestamp, :string)
  end
end
