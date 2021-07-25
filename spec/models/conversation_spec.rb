require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Conversation, type: :model do
  # Association test
  # ensure Conversation model has a 1:m relationship with the Massage model
  it { should have_many(:massages).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:friend) }
  it { should belong_to(:user) }
end