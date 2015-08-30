class HomeController < ApplicationController

  def index
    if user_signed_in?
      @last_posts = current_user.timeline
    else
      @last_posts = Post.order("created_at DESC")
    end
  end


end
