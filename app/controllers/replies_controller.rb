class RepliesController < ApplicationController

  before_action :set_reply, only:[:index, :create]
  def index
    @tweet = Tweet.find(params[:tweet_id])
    @replies = Reply.new
    @reply = @tweet.replies
  end

  def create
    @reply = @tweet.replies.build(reply_params)
    @reply.user = current_user
    @reply.save!
    redirect_to tweet_path(@tweet)
  end

  private

  def reply_params
    params.require(:reply).permit(:comment)
  end


  def set_reply
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies
  end

end
