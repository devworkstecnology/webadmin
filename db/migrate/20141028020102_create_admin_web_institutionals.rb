class CreateAdminWebInstitutionals < ActiveRecord::Migration
  def change
    create_table :admin_web_institutionals do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
