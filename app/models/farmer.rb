class Farmer < ApplicationRecord
  belongs_to :farm

  def self.owns_land_filter
    self.where('owns_land = true')
  end

  def self.sort_name
    order(:name)
  end
end
