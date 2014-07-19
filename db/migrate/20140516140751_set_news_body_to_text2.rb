class SetNewsBodyToText2 < ActiveRecord::Migration
  def change
    change_column :news, :body, :text
  end
end
