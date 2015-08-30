class NotificationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    mark_as_seen
    @notifications = Notification.where(user: current_user)
  end

  private
  def mark_as_seen
    notifications = Notification.unseen(current_user)
    notifications.each do |n|
      n.seen!
    end
  end
end
