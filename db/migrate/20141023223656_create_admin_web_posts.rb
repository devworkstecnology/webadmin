class CreateAdminWebPosts < ActiveRecord::Migration
  def change
    create_table :admin_web_posts do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.string :abstract
      t.text :body, null: false
      t.string :image

      t.timestamps
    end

    add_index :admin_web_posts, :user_id
  end
end
