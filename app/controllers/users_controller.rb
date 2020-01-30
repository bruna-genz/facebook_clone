class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @post = Post.new
    @comment = Comment.new
  end
end
