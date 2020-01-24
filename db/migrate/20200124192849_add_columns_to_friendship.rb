class AddColumnsToFriendship < ActiveRecord::Migration[6.0]
  def change
    add_column :friendships, :confirmed, :boolean
    add_reference :friendships, :user 
    add_reference :friendships, :friend
  end
end
