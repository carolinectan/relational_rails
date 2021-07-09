require 'rails_helper'

RSpec.describe Farm, type: :model do
  it {should have_many :farmers}
end
