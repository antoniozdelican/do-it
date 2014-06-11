require 'spec_helper'

describe HomeController do

  let(:user) { FactoryGirl.create(:user) }
  
  before(:each) do
    sign_in user
  end
  
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the categories into @categories" do
      category1 = FactoryGirl.create(:category, name: "Category1")
      category2 = FactoryGirl.create(:category, name: "Category2")
      get :index
      expect(assigns(:categories)).to match_array([category1, category2])    
    end
  end
end