class AddCategoryToUnit < ActiveRecord::Migration
  def up
    add_column :units, :category_id, :integer
    add_foreign_key(:units, :categories)
  end

  def down
    remove_column :units, :category_id
    remove_foreign_key(:units, :categories)
  end
end
