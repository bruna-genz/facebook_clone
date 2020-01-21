class AddFeaturesColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :birthday, :datetime
    add_column :users, :gender, :string
  end
end
