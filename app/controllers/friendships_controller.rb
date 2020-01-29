class FriendshipsController < ApplicationController
  before_action :find_friend, except: [:index]
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
    @friendships = current_user.friends
  end

  def destroy
    @friendship.destroy
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
    @friendship = if current_user.is_requested?(@friend)
                    current_user.inverse_friendships.find(params[:id])
                  else
                    current_user.friendships.find(params[:id])
                  end
  end

  def find_friend
    @friend = User.find(params[:user_id])
  end
end
