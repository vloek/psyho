class AddVersionToFileAttaches < ActiveRecord::Migration
  def change
    add_column :file_attaches, :version, :string
    add_column :file_attaches, :string, :string
  end
end
