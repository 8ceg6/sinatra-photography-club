class ChangeColumnInLenses < ActiveRecord::Migration
  def change
    rename_column :lenses, :type, :kind
  end
end
