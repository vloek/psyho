class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.string :longname
      t.integer :size
      t.string :version
      t.datetime :date
      t.string :editor
      t.string :holders
      t.text :description

      t.timestamps
    end
  end
end
