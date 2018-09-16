require 'rails_helper'

# Test suite for the Event model:
RSpec.describe Event, type: :model do
  # Validation tests:
  # we ensure that the start_time, end_time, label and category columns are present before saving:
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
  it { should validate_presence_of(:label) }
  it { should validate_presence_of(:category) }
end
