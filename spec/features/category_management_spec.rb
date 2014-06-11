require 'spec_helper'

describe "Category management" do
  before(:each) do
    user = FactoryGirl.create(:user, username: "antonio", password: "antonio1234", password_confirmation: "antonio1234")
    visit "/"
    fill_in "user[username]", with: "antonio"
    fill_in "user[password]", with: "antonio1234"
    click_button "Sign in"
  end

  it "user goes to new category page" do
    click_link "New category"
    expect(page).to have_text("New category")
    expect(page).to have_button("Save this category")
  end

  it "user tries to create valid category" do
    click_link "New category"
    fill_in "category[name]", with: "Stuff"
    fill_in "category[description]", with: "Some stuff to do."
    click_button "Save this category"
    expect(page).to have_text("Start doing things now!")
    expect(page).to have_text("Stuff")
  end

  it "user tries to create invalid category" do
    click_link "New category"
    fill_in "category[name]", with: ""
    fill_in "category[description]", with: "Some stuff to do."
    click_button "Save this category"
    expect(page).not_to have_text("Start doing things now!")
    expect(page).to have_text("Name can't be blank")
  end
end