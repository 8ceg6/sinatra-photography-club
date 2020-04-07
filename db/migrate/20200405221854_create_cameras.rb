class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :brand
      t.string :model  
      t.integer :users_id
    end
  end
end
