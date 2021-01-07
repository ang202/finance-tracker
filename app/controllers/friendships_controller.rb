class FriendshipsController < ApplicationController
  def create
    # friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: params[:friend])
    if current_user.save
      flash[:notice] = "Follow friend successfully"
    else
      flash[:alert] = "There is something problem happened" 
    end
    redirect_to my_friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash.now[:alert] = "Stopped following"
    redirect_to my_friends_path
  end

end
