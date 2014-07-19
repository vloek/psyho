class AddUnitIdToFileAttaches < ActiveRecord::Migration
  def change
    add_column :file_attaches, :unit_id, :integer
  end
end
