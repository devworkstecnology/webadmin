class AddUserTypeToUsers < ActiveRecord::Migration
  def change
    add_column :admin_web_users, :user_type, :integer
  end
end
