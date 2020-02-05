class AddPostReferenceToLikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :post
  end
end
