class CreateFarms < ActiveRecord::Migration[5.2]
  def change
    create_table :farms do |t|
      t.timestamp :created_at
      t.timestamp :updated_at
      t.boolean :has_animals
      t.integer :num_of_fields
      t.string :name
    end
  end
end
