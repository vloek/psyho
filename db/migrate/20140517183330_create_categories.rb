class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string  :name
      t.string  :url
      t.text  :description
      t.integer :parent_id # this is mandatory
      t.integer :position # this is mandatory
      t.integer :depth # this is optional
      t.integer :children_count # this is optional
    end
  end

  def self.down
    drop_table :categories
  end
end