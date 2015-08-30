class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :notificable, polymorphic: true
  validates :user, presence: true
  validates :notificable, presence: true
  validates :notificable_type, presence: true

  scope :unseen, ->(user) {
    Notification.where(user_id: user.id, seen: false)
  }

  def seen!
    self.update_column(:seen,true)
  end

end
