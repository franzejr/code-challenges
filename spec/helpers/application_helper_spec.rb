require 'rails_helper'

RSpec.describe ApplicationHelper, "#formatted_score_for" do
  include Devise::TestHelpers

  it "displays gravatar url" do
    user = User.new(email: "franzejr@gmail.com")
    formatted_gravatar_url = helper.get_gravatar(user)

    expect(formatted_gravatar_url).to eq "<img src=\"http://www.gravatar.com/avatar/83e0ca4e73f2305ece2c629dd4bba53f?s=96\" alt=\"83e0ca4e73f2305ece2c629dd4bba53f?s=96\" />"
  end

  it "displays follow/unfollow button" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    sign_in user1
    user1.start_follow(user2)

    expect("<a href=\"http://test.host/users/2/unfollow\">Unfollow</a>").to eq helper.follow_or_unfollow(user2)
    user1.stop_follow(user2)
    expect("<a href=\"http://test.host/users/2/follow\">Follow</a>").to eq helper.follow_or_unfollow(user2)
  end
end
