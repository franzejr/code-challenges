require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'validations' do
    it {is_expected.to validate_presence_of(:user)}
    it {is_expected.to validate_presence_of(:notificable)}
  end

  describe 'unseen/seen' do
    let(:user1) do
      FactoryGirl.create(:user)
    end

    let(:user2) do
      FactoryGirl.create(:user)
    end

    it 'should return unseen notifications' do
      user1.start_follow(user2)
      expect(Notification.unseen(user2).count).to eq 1
    end

    it 'should set a notification as seen' do
      user1.start_follow(user2)
      Notification.unseen(user2).first.seen!
      expect(Notification.unseen(user2).count).to eq 0
    end
  end
end
