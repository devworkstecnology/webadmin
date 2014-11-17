class CreateAdminWebAlbums < ActiveRecord::Migration
  def change
    create_table :admin_web_albums do |t|
      t.string :title, null: false
      t.date :date, null: false
      t.string :local

      t.timestamps

    end
  end
end
