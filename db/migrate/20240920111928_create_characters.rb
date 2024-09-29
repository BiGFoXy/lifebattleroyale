class CreateCharacters < ActiveRecord::Migration[7.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :race
      t.integer :status
      t.integer :exp
      t.integer :gold
      t.integer :user_id
      t.integer :winstreak, :default => 0

      t.timestamps
    end
  end
end
