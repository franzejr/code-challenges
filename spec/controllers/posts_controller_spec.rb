require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET index" do
    it "render index" do
      get :index
      expect(response).to be_success
      should render_template("posts/index")
    end
  end


  describe "POST create" do
    it "save a post" do
      user = FactoryGirl.create(:user)
      sign_in user
      post :create, :message=> "Test", format: "js"
      expect(flash[:success]).to be_present
      expect(response).to be_success
    end

    it "should return an error, if some problem in the post" do
      user = FactoryGirl.create(:user)
      sign_in user
      post :create, format: "js"
      should render_template(:index)
      expect(:alert).to be_present
    end
  end

  describe "GET show" do
    it "should render show template" do
      FactoryGirl.create(:post)
      get :show, id: 1
      expect(response).to be_success
      should render_template("posts/show")
    end
  end

  describe "DELETE destroy" do

    it "should destroy the post" do
      p = FactoryGirl.create(:post)
      sign_in p.user

      delete :destroy, id: p.id, format: "js"
      expect(flash[:success]).to be_present
      expect(response).to be_success
    end
  end
end
