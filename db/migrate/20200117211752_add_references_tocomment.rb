class AddReferencesTocomment < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :post
    add_reference :comments, :commenter
  end
end
