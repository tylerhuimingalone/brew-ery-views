require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:username).when("Tyler") }
  it { should_not have_valid(:username).when(nil, "") }

  it { should have_valid(:email).when("tyler@test.com") }
  it { should_not have_valid(:email).when(nil, "", "tylertest.com") }

  it { should have_valid(:admin).when(true, false) }
  it { should_not have_valid(:admin).when(nil, "") }

  it { should have_valid(:password).when("password") }
  it { should_not have_valid(:password).when(nil, "", "launch") }
end
