class Garden < ApplicationRecord
  has_many :plants

  def plant_count
    plants.length
  end
end
