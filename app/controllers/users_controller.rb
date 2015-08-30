class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :profile]
  before_action :find_user

  def index
    @users = User.all
  end

  def profile

  end

  def follow
    current_user.start_follow(@user)
    redirect_to(:back)
  end

  def unfollow
    current_user.stop_follow(@user)
    redirect_to(:back)
  end

  private

  def find_user
    @user = User.find_by_id(params[:id])
  end

end
