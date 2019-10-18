require 'spec_helper'

RSpec.describe Review, type: :model do
  it { should validate_numericality_of(:rating) }
  it { should_not have_valid(:rating).when(nil, "") }
end
