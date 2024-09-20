class CreateArtifacts < ActiveRecord::Migration[7.2]
  def change
    create_table :artifacts do |t|
      t.string :name
      t.string :description
      t.integer :inventory_id

      t.timestamps
    end
  end
end
