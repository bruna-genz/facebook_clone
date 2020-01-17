class DeleteColumnsFromLike < ActiveRecord::Migration[6.0]
  def change
    remove_column :likes, :post_id
    remove_column :likes, :comment_id
  end
end
