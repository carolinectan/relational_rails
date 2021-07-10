class Plant < ApplicationRecord
  belongs_to :garden
  def self.edible_filter
    where('edible = true')
  end

  def self.sort_name
    order(:name)
  end
end
