class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :url
      t.text :lyrics
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
