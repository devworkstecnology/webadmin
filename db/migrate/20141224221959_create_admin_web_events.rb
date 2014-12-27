class CreateAdminWebEvents < ActiveRecord::Migration
  def change
    create_table :admin_web_events do |t|
      t.string :title, :null => false
      t.datetime :start_date
      t.datetime :end_date
      t.text :description, :null => false
      t.string :street, :null => false
      t.string :number
      t.string :zipcode, :null => false
      t.string :neighborhood, :null => false
      t.string :city, :null => false
      t.string :state, :null => false

      t.timestamps
    end
  end
end
