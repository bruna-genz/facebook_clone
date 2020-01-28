class FriendshipsController < ApplicationController
  before_action :find_friend, except: [:index]
  before_action :find_friendship, only: [:destroy]
  before_action :find_inverse_friendship, only: [:inverse_destroy]
  
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
    @friendships = current_user.friends
  end

  def destroy
    @friendship.destroy
    redirect_to find_friends_path 
  end

  def inverse_destroy
    @inverse_friendship
    redirect_to find_friends_path 
  end

  def confirm
    current_user.confirm_friend(@friend)
    redirect_to find_friends_path
  end

  private
      def find_friendship 
        @friendship = current_user.friendships.find(params[:id])
      end
      def find_inverse_friendship 
        @inverse_friendship = current_user.inverse_friendships.find(params[:id])
      end
      def find_friend
        @friend = User.find(params[:user_id])
      end
end
