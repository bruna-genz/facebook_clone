class FriendshipsController < ApplicationController
  before_action :find_friend
  before_action :find_friendship, only: [:destroy]
  
  def new
    @friendship = Friendship.new
  end

  def create
    if current_user.friend?(@friend)
      destroy
    else
      @friendship = current_user.friendships.create(friend_id: params[:user_id])
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

      def find_friend
        @friend = User.find(params[:user_id])
      end
end
