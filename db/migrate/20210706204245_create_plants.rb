class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.timestamp :created_at
      t.timestamp :updated_at
      t.string :name
      t.boolean :edible
      t.integer :mature_height
      t.references :garden, foreign_key: true
    end
  end
end
