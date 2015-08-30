require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_uniqueness_of(:username)}
  end

  describe 'Follow' do

    let(:user1) do
      FactoryGirl.create(:user)
    end

    let(:user2) do
      FactoryGirl.create(:user)
    end

    it 'should create notification after follow another user' do
      user2_notifications_before = user2.notifications.count
      user1.start_follow(user2)
      expect(user2.notifications.count).to eq  user2_notifications_before + 1
    end

    it 'should delete notification after unfollow another user' do
      user1.start_follow(user2)
      user2_notifications_before = user2.notifications.count
      user1.stop_follow(user2)
      expect(user2.notifications.count).to eq  user2_notifications_before -1
    end

    it 'should return the number of followers' do
      user1.start_follow(user2)
      expect(user2.followers_count).to eq 1
      expect(user1.followers_count).to eq 0
      expect(user1.followings_count).to eq 1
    end

    it 'should return the number of following' do
      user1.start_follow(user2)
      expect(user1.followings_count).to eq 1
      expect(user2.followings_count).to eq 0
      expect(user2.followers_count).to eq 1
    end
  end

  describe 'Timeline' do

    let(:user_with_posts) do
      FactoryGirl.create(:user, :with_posts)
    end

    let(:user_to_be_followed) do
      FactoryGirl.create(:user, :with_posts)
    end

    it 'should render his posts and the posts the user is following' do
      user_with_posts.start_follow(user_to_be_followed)

      expect(user_with_posts.timeline.count).to eq user_with_posts.posts.count + user_to_be_followed.posts.count
    end
  end

  describe 'Notifications' do

    let(:user1) do
      FactoryGirl.create(:user)
    end

    let(:user2) do
      FactoryGirl.create(:user)
    end

    it 'unseen_notifications' do
      user1.start_follow(user2)
      expect(user2.unseen_notifications.count).to eq 1
    end
  end

end
