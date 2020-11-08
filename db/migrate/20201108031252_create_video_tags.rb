class CreateVideoTags < ActiveRecord::Migration[6.0]
  def change
    create_table :video_tags do |t|
      t.references :video, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
    end
  end
end
