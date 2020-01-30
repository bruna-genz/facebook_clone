class FriendshipsController < ApplicationController
  before_action :find_friend, except: [:index]
  before_action :find_friendship, only: [:destroy]
  before_action :find_user, only: [:index]

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
    @friendships = @user.friends
  end

  def destroy
    @friendship.destroy if @friendship
    @friendship2.destroy if @friendship2
    flash[:danger] = 'Friendship request denied'
    redirect_to find_friends_path
  end

  def confirm
    current_user.confirm_friend(@friend)
    flash[:success] = 'You have a new friend :)'
    redirect_to find_friends_path
  end

  private

  def find_friendship
    @friend = User.find(params[:user_id])
    @friendship = Friendship.where('user_id = ? and friend_id = ?', current_user.id, @friend.id).first
    @friendship2 = Friendship.where('user_id = ? and friend_id = ?', @friend.id, current_user.id).first
  end

  def find_friend
    @friend = User.find(params[:user_id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
