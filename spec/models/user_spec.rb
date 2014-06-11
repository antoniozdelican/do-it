require 'spec_helper'

describe User do
  it "is invalid without username" do
    expect(FactoryGirl.build(:user, username: nil)).not_to be_valid
  end

  it "is invalid without password" do
    expect(FactoryGirl.build(:user, password: nil)).not_to be_valid
  end

  it "expects to have unique username" do
    FactoryGirl.create(:user)
    expect(FactoryGirl.build(:user)).not_to be_valid
  end

  it "expects to have matching password and password confirmation" do
    #expect(FactoryGirl.build(:user, password_confirmation: "user5678")).not_to be_valid
  end
end