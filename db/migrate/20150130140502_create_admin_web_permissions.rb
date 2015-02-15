class CreateAdminWebPermissions < ActiveRecord::Migration
  def change
    create_table :admin_web_permissions do |t|
      t.references :user
      t.string :model
      t.string :permission_type

      t.timestamps
    end

    add_index :admin_web_permissions, :user_id
  end
end
