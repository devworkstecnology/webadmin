class AddImageToWebAdminEvents < ActiveRecord::Migration
  def change
    add_column :web_admin_events, :image, :string
  end
end
