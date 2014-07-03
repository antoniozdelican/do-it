require 'spec_helper'

describe User do
  it "is invalid without a username" do
    expect(FactoryGirl.build(:user, username: nil)).not_to be_valid
  end

  it "is invalid without a password" do
    expect(FactoryGirl.build(:user, password: nil)).not_to be_valid
  end

  it "expects to have unique a username" do
    FactoryGirl.create(:user, username: "myUser")
    expect(FactoryGirl.build(:user, username: "myUser")).not_to be_valid
  end

  it "expects to have matching password and password confirmation" do
    expect(FactoryGirl.build(:user, password_confirmation: "user5678")).not_to be_valid
  end

  it "expects to have categories" do
    user = FactoryGirl.create(:user)
    category1 = FactoryGirl.create(:category, user: user)
    expect(user.categories.count).to eq(1)
    expect(user.categories.first).to eq(category1)
  end
end