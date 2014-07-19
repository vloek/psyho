class CreateUnitsFileAttaches < ActiveRecord::Migration
  def change
    create_table :units_file_attaches do |t|
      t.integer :unit_id
      t.integer :file_attach_id
    end
  end
end
