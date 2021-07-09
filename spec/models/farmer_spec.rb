require 'rails_helper'

RSpec.describe Farmer, type: :model do
  it {should belong_to :farm}
end
