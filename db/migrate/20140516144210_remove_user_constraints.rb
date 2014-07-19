class RemoveUserConstraints < ActiveRecord::Migration
  def change
    remove_foreign_key(:news, :users)
    remove_foreign_key(:pages, :users)
    remove_column :news, :author
    remove_column :news, :user_id
    remove_column :pages, :user_id
    remove_column :pages, :author
  end
end
