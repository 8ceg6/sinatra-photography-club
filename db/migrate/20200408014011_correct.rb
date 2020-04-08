class Correct < ActiveRecord::Migration
  def change
      rename_column :cameras, :users_id, :user_id
  end
end
