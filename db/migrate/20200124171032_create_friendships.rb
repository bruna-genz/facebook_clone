class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.integer :action_user_id
      t.integer :status

      t.timestamps
    end
  end
end
