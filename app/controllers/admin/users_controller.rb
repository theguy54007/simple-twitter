class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def edit
  end

  def destroy
  end

end
