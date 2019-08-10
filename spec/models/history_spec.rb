require 'rails_helper'

RSpec.describe History, type: :model do
  
  # Ensure the columns are in
  it { should validate_presence_of(:seed) }
  it { should validate_presence_of(:comparator) }
  it { should validate_presence_of(:algorithm) }
  
end
