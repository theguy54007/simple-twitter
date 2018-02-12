class Admin::TweetsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @tweets = Tweet.page(params[:page]).per(10)
    @users = User.all

  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to admin_tweets_path
    flash[:alert] = "Tweet was deleted"
  end


  private
  def tweet_params
    params.require(:tweet).permit(:description)
  end


end
