class AddforeignKeyToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :creator
  end
end
