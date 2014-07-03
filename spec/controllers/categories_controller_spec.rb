require 'spec_helper'

describe CategoriesController do

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
      category1 = FactoryGirl.create(:category, name: "Category1", user_id: user.id)
      category2 = FactoryGirl.create(:category, name: "Category2", user_id: user.id)
      get :index
      expect(assigns(:categories)).to match_array([category1, category2])    
    end
  end

  describe "GET #show" do
    it "loads a category into @category" do
      category = FactoryGirl.create(:category)
      get :show, id: category.id
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "GET #new" do
    it "loads a new category into @category" do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "redirects to the home page" do
        category = FactoryGirl.build(:category)
        post :create, category: category.attributes
        expect(response).to redirect_to(root_url)
      end

      it "creates a new category" do
        expect(Category.count).to eq(0)
        category = FactoryGirl.build(:category)
        post :create, category: category.attributes
        expect(Category.count).to eq(1)
      end
    end

    context "with invalid attributes" do
      it "renders to the new page" do
        category = FactoryGirl.build(:category, name: nil)
        post :create, category: category.attributes
        expect(response).to render_template(:new)
      end

      it "doesn't create a new category" do
        expect(Category.count).to eq(0)
        category = FactoryGirl.build(:category, name: nil)
        post :create, category: category.attributes
        expect(Category.count).to eq(0)
      end
    end
  end

  describe "GET #edit" do
    it "loads a category into @category" do
      category = FactoryGirl.create(:category)
      get :edit, id: category.id
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "PATCH #update" do
    context "valid attributes" do
      it "redirects to the home page" do
        category = FactoryGirl.build(:category)
        post :create, category: category.attributes
        expect(response).to redirect_to(root_url)
      end

      it "changes @category's attributes" do
        category = FactoryGirl.create(:category)
        expect(category.name).to eq("Fun")
        category_update = FactoryGirl.build(:category, name: "Update Category")
        patch :update, id: category.id, category: category_update.attributes
        category.reload
        expect(category.name).to eq("Update Category")
      end
    end

    context "invalid attributes" do
      it "renders to the new page" do
        category = FactoryGirl.build(:category, name: nil)
        post :create, category: category.attributes
        expect(response).to render_template(:new)
      end

      it "doesn't change @category's attributes" do
        category = FactoryGirl.create(:category)
        expect(category.name).to eq("Fun")
        category_update = FactoryGirl.build(:category, name: nil)
        patch :update, id: category.id, category: category_update.attributes
        category.reload
        expect(category.name).to eq("Fun")
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the category" do
      category = FactoryGirl.create(:category)
      expect(Category.count).to eq(1)
      delete :destroy, id: category.id
      expect(Category.count).to eq(0)
    end

    it "redirects to the home page" do
      category = FactoryGirl.create(:category)
      delete :destroy, id: category.id
      expect(response).to redirect_to(root_url)
    end
  end
end