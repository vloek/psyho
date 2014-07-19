class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :parent
      t.string :url
      t.string :title
      t.string :keywords
      t.string :description
      t.string :head
      t.text :body
      t.boolean :status

      t.timestamps
    end
  end
end
