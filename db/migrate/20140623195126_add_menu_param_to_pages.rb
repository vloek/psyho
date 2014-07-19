class AddMenuParamToPages < ActiveRecord::Migration
  def change
    add_column :pages, :menu_id, :integer
    add_column :pages, :position, :integer
  end
end
