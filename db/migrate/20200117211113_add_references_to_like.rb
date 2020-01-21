class AddReferencesToLike < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :liker
    add_reference :likes, :post
    add_reference :likes, :comment
  end
end
