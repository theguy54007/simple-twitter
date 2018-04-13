class Admin::UsersController < Admin::BaseController
  def index
    @users =User.page(params[:page]).per(10).order(tweets_count: :desc)
  end

  def edit
  end

  def destroy
  end

end
