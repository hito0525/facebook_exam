class UsersController < ApplicationController
before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @followed_users = @user.followed_users
    @followers = @user.followers
  end

 private

    def set_user
    @user= User.find(params[:id])
    end

end
