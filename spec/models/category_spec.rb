require 'spec_helper'

describe Category do
  it "is invalid without a name" do
    expect(FactoryGirl.build(:category, name: nil)).not_to be_valid
  end

  it "has a unique name" do
    FactoryGirl.create(:category, name: "Test")
    expect(FactoryGirl.build(:category, name: "Test")).not_to be_valid
  end

  it "has a user" do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category, user: user)
    expect(category.user).to be_valid
    expect(category.user).to eq(user)
  end

  it "has items" do
    category = FactoryGirl.create(:category)
    item1 = FactoryGirl.create(:item, category: category)
    expect(category.items.count).to eq(1)
    expect(category.items.first).to eq(item1)
  end

  it "destroy itself and all associated items" do
    category = FactoryGirl.create(:category)
    item1 = FactoryGirl.create(:item, category: category)
    expect(Item.count).to eq(1)
    category.destroy
    expect(Item.count).to eq(0)
  end
end