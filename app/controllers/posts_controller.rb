class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :destroy]
  respond_to :js

  def index

  end

  def create
    message = params[:message]
    post = Post.new(message: message, user: current_user)
    if post.save
      @last_posts = current_user.timeline
      flash[:success] = "Post created!"
    else
      render :index, alert: "Something wrong"
    end
  end

  def show
    find_post
  end

  def destroy
    find_post
    if current_user.posts.find(params[:id]).destroy
      @last_posts = current_user.timeline
      flash[:success] = "Post deleted"
    else
      flash[:error] = "Some problem deleting your post"
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
