class ChangeUnitFileSizeToFloat < ActiveRecord::Migration
  def up
    change_column :units, :size, :float
  end
  def down
    change_column :units, :size, :integer
  end
end
