#DOES NTHN
class SetNewsBodyToText < ActiveRecord::Migration
  def change
    change_column :news, :body, :string
  end
end
