class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.integer :timestamp
      t.text :lyrics
      t.string :title
      t.references :video, null: false, foreign_key: true

      t.timestamps
    end
  end
end
