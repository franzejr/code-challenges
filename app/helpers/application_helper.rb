module ApplicationHelper
  def get_gravatar(user=current_user, size=96)
    image_tag "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{size}"
  end

  def follow_or_unfollow(user)
    if current_user.following?(user)
      link_to("Unfollow", unfollow_user_url(user))
    else
      link_to("Follow", follow_user_url(user))
    end
  end
end
