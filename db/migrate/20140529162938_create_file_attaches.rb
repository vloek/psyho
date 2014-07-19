class CreateFileAttaches < ActiveRecord::Migration
  def change
    create_table :file_attaches do |t|
      t.attachment :file

      t.timestamps
    end
  end
end
