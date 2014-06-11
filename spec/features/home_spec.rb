require 'spec_helper'

describe "Home" do
  it "Displays the user's username and message after successful login" do
    user = FactoryGirl.create(:user, username: "antonio", password: "antonio1234", password_confirmation: "antonio1234")
    visit "/"
    fill_in "user[username]", with: "antonio"
    fill_in "user[password]", with: "antonio1234"
    click_button "Sign in"

    expect(page).to have_text("antonio")
    expect(page).to have_text("Signed in successfully.")
  end

  it "Displays invalid message on unsuccessful login" do
    user = FactoryGirl.create(:user, username: "antonio", password: "antonio1234", password_confirmation: "antonio1234")
    visit "/"
    fill_in "user[username]", with: "antonio"
    fill_in "user[password]", with: "antonio5678"
    click_button "Sign in"

    expect(page).not_to have_text("antonio")
    expect(page).to have_text("Invalid email or password.")
  end
end