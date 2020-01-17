class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :sub-content

      t.timestamps
    end
  end
end
