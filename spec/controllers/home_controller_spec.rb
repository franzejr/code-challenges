require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  include Devise::TestHelpers

  before do
    FactoryGirl.create(:post)
    FactoryGirl.create(:post)
  end

  context "when user is logged in" do
    it "should return his timeline" do
      user = FactoryGirl.create(:user, :with_posts)
      sign_in user
      get :index

      expect(response).to render_template :index
      assigns(:last_posts).should =~ user.timeline
    end
  end

  context "when user is not logged" do
    it "should return all the posts" do
      posts = Post.order("created_at DESC")
      FactoryGirl.create(:user, :with_posts)
      get :index

      expect(response).to render_template :index
      assigns(:last_posts).should =~ posts
    end
  end

end
