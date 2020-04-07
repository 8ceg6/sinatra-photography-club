class CreateLenses < ActiveRecord::Migration
  def change
    create_table :lenses do |t|
      t.string :type  
      t.string :focal_length 
      t.integer :cameras_id
    end
  end
end
