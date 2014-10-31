class CreateAdminWebVideos < ActiveRecord::Migration
  def change
    create_table :admin_web_videos do |t|
      t.string :description
      t.string :link

      t.timestamps
    end
  end
end
