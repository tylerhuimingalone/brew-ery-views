require 'spec_helper'

RSpec.describe Brewery, type: :model do
  it { should have_valid(:name).when("Brew City") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:address).when("123 example st.") }
  it { should_not have_valid(:address).when(nil, "") }

  it { should have_valid(:city).when("Boston") }
  it { should_not have_valid(:city).when(nil, "") }

  it { should have_valid(:state).when("MA") }
  it { should_not have_valid(:state).when(nil, "") }

  it { should have_valid(:zip).when("02134") }
  it { should_not have_valid(:zip).when(nil, "") }
end
