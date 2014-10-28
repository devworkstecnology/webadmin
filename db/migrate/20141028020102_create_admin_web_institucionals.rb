class CreateAdminWebInstitucionals < ActiveRecord::Migration
  def change
    create_table :admin_web_institucionals do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
