class AddMenuParam2ToPages < ActiveRecord::Migration
  def change
    add_column :pages, :menu_name, :string
  end
end
