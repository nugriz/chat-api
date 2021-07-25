require 'rails_helper'

# Test suite for the Item model
RSpec.describe Massage, type: :model do
  # Association test
  # ensure an item record belongs to a single conversation record
  it { should belong_to(:conversation) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:sender) }
  it { should validate_presence_of(:content) }
end