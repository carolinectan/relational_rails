class CreateFarmers < ActiveRecord::Migration[5.2]
  def change
    create_table :farmers do |t|
      t.timestamp :created_at
      t.timestamp :updated_at
      t.boolean :owns_land
      t.integer :age
      t.string :name
      t.references :farm, foreign_key: true
    end
  end
end
