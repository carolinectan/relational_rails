class Garden < ApplicationRecord
  has_many :plants

  def self.sort_descending
    order(created_at: :desc)
  end

  def plant_count
    plants.length
  end
end
