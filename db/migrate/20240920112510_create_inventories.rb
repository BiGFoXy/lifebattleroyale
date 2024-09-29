class CreateInventories < ActiveRecord::Migration[7.2]
  def change
    create_table :inventories do |t|
      t.integer :character_id
      t.integer :artifact_id

      t.timestamps
    end
  end
end
