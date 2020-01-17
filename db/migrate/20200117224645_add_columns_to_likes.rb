class AddColumnsToLikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :likeable
    add_column :likes, :likeable_type, :string
  end
end
