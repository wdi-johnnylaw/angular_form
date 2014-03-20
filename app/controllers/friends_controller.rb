class FriendsController < ApplicationController
  def index
    @friends = current_user.friends
  end

  def destroy
    sleep 0.5
    @user = User.find_by username: params[:id]
    @user.outgoing_friendships.where(requested: current_user).destroy_all
    @user.incoming_friendships.where(requester: current_user).destroy_all
    render json: { status: 'ok' }
  end
end
