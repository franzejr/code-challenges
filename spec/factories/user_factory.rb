FactoryGirl.define do

  factory :user do
    sequence(:username) {Faker::Name.name}
    sequence(:email) {Faker::Internet.email }
    sequence(:password) {|n| "{n}_12345678" }

    trait :with_posts do
      ignore do
        number_of_posts 10
      end

      after(:build) do |user, evaluator|
        create_list(:post, evaluator.number_of_posts, user: user)
      end
    end

  end

end
