class CreateAdminWebImages < ActiveRecord::Migration
  def change
    create_table :admin_web_images do |t|
      t.references :album, null: false
      t.string :file, null: false
      t.boolean :cover

      t.timestamps
    end
  end
end
