FactoryGirl.define do
  factory :post do
    sequence(:message) {|n| "message_{n}" }
    user { create(:user) }
  end
end
