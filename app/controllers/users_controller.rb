class UsersController < ApplicationController

  before_action :set_user, only: [:tweets, :edit, :update, :followings, :followers, :likes]
  def tweets
    @tweets = @user.tweets
    @replies = Reply.new
  end

  def edit
    unless @user == current_user
      redirect_to users_path(@user)
    end
  end

  def update
    @user.update(user_params)
    redirect_to tweets_user_path(@user)
  end

  def followings
    @followings = @user.followings# 基於測試規格，必須講定變數名稱
  end

  def followers
    @followers = @user.followers# 基於測試規格，必須講定變數名稱
  end

  def likes
    @likes = @user.liked_tweets # 基於測試規格，必須講定變數名稱

  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
