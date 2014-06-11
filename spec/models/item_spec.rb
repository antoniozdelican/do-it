require 'spec_helper'

describe Item do
  it "is invalid without a name" do
    expect(FactoryGirl.build(:item, name: nil)).not_to be_valid
  end

  it "has a unique name" do
    FactoryGirl.create(:item, name: "Test")
    expect(FactoryGirl.build(:item, name: "Test")).not_to be_valid
  end

  it "has a category" do
    category = FactoryGirl.create(:category)
    item = FactoryGirl.create(:item, category: category)
    expect(item.category).to be_valid
    expect(item.category).to eq(category)
  end

  it "has a status" do
    status = Status.pending
    expect(FactoryGirl.build(:item).status).to eq(status)
  end

  it "is invalid without a status" do
    expect(FactoryGirl.build(:item, status_id: nil)).not_to be_valid
  end
end