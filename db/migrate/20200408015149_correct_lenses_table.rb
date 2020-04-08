class CorrectLensesTable < ActiveRecord::Migration
  def change
    rename_column :lenses, :cameras_id, :camera_id
  end
end
