class FollowshipsController < ApplicationController
  def create
    @followship = current_user.followships.build(following_id: params[:following_id])
    respond_to do |format|
      unless params[:following_id] == current_user.id
        if @followship.save
          @user = User.find(@followship.following_id)
          #flash[:notice] = "Successfully followed"
          format.html{redirect_back fallback_location: root_path}
          format.js
        else
          flash[:alert] = @followship.errors.full_messages.to_sentence
          format.html{redirect_back fallback_location: root_path}
          format.js
        end
      end

    end

  end

  def destroy
    @followship = current_user.followships.where(following_id: params[:id]).first
    @user = User.find(@followship.following_id)
    @followship.destroy
    flash[:alert] = "Successfully unfollowed"
    respond_to do |format|
      format.html {redirect_back fallback_location: root_path}
      format.js
    end
  end
end
