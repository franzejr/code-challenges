class SearchesController < ApplicationController
  before_filter :authenticate_user!

  def index
    query = params[:query]
    @users = User.where("username like ?", "%#{query}%")
  end
end
