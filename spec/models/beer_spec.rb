require 'spec_helper'

RSpec.describe Beer, type: :model do
  it { should have_valid(:name).when("Brews") }
  it { should_not have_valid(:name).when(nil, "") }
end
