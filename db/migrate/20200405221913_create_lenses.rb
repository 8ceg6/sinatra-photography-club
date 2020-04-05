class CreateLenses < ActiveRecord::Migration
  def change
    create_table :lenses do |t|
      t.string :brand
      t.string :type  
      t.string :focal_length 
      t.integer :camera_id
      
    end
  end
end
