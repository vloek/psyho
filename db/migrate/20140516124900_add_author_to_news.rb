class AddAuthorToNews < ActiveRecord::Migration
  def change
    change_table :pages do |t|
      t.integer :author
    end
    add_foreign_key(:news, :users)
    add_foreign_key(:pages, :users)
  end
end
