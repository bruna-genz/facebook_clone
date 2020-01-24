class RemoveColumnsFromLikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :likes, :likeable_id
    remove_column :likes, :likeable_type
  end
end
