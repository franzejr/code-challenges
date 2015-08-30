class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true
  validates :username, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :notifications, dependent: :destroy
  acts_as_follower


  def notifications
    Notification.where("user_id = :user_id", user_id: self.id).order("created_at DESC")
  end

  def followers_count
    Follow.where(followable_id: self.id).count
  end

  def followings_count
    Follow.where(follower_id: self.id).count
  end

  def unseen_notifications
    self.notifications.where(seen: false)
  end

  def start_follow(other_user)
    if !following?(other_user)
      Notification.create(user: other_user, notificable: self, notificable_type:  self.class.to_s)
      follow(other_user)
    end
  end

  def stop_follow(other_user)
    if following?(other_user)
      stop_following(other_user)
      Notification.find_by(user: other_user, notificable: self).destroy
    end
  end

  def timeline
    ids = []
    follows_ids = Follow.where(follower_id: self.id).order("created_at DESC")
    follows_ids.each do |id|
      ids << id.followable_id
    end
    ids << self.id
    Post.where(user_id: ids).order("created_at DESC")
  end

end
