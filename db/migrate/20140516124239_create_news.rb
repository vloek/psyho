class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.datetime :date
      t.string :title
      t.string :keywords
      t.string :description
      t.string :url
      t.string :head
      t.string :anounce
      t.string :body
      t.integer :author
      t.boolean :status
      t.references :user

      t.timestamps
    end
    
    change_table :pages do |t|
      t.references :user
    end
  end
end
