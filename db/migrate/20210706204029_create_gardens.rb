class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.timestamp :created_at
      t.timestamp :updated_at
      t.string :name
      t.boolean :irrigation
      t.integer :plant_capacity
    end
  end
end
