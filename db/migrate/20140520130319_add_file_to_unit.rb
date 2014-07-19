class AddFileToUnit < ActiveRecord::Migration
  def up
    add_column :units, :file, :string
  end
  def down
    remove_column :units, :file
  end
end
