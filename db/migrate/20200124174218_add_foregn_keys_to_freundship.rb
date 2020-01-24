class AddForegnKeysToFreundship < ActiveRecord::Migration[6.0]
  def change
    add_references :friendship, :user 
    add_references :friendship, :friend
    add_column :friendship, :confirmed, :boolean
  end
end
