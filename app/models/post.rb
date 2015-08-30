class Post < ActiveRecord::Base
  validates :message, presence: true
  validates :message, length: {minimum: 3, maximum: 140}
  belongs_to :user

  scope :last_posts, lambda {where("posts.created_at > ? ", 3.day.ago)}

end
