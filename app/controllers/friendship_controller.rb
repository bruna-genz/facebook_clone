class FriendshipController < ApplicationController
  before_action :find_friendship, only: [:destroy]
  def new
    @friendship = Friendship.new
  end

  def create
    if friends?
      destroy
    else
      @friendship = current_user.friendships.create(params[:user.id])
    end
    redirect_to find_friends_path 
  end

  def index
    @friendships = current_user.friendships.all
  end

  def destroy
    @friendship.destroy
    redirect_to find_friends_path 
  end

  private
      def find_friendship 
        @friendship = current_user.friendships.find(params[:id])
      end

      def friends?
        Friendship.where(user_id: current_user.id, friend_id: params[:user.id]).exists?
      end
end
