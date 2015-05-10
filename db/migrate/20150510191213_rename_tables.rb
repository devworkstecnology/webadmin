class RenameTables < ActiveRecord::Migration
  def change
    rename_table :admin_web_albums, :web_admin_albums
    rename_table :admin_web_users, :web_admin_users
    rename_table :admin_web_posts, :web_admin_posts
    rename_table :admin_web_institutionals, :web_admin_institutionals
    rename_table :admin_web_videos, :web_admin_videos
    rename_table :admin_web_images, :web_admin_images
    rename_table :admin_web_events, :web_admin_events
    rename_table :admin_web_permissions, :web_admin_permissions
  end
end
