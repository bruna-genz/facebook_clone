class UsersController < ApplicationController
  def index
    if params[:search]
      @users = User.where("first_name LIKE?","%"+ params[:search]+"%")
      flash[:alert] = "No user with name #{params[:search]} has been found" if @users.empty?
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @comment = Comment.new
  end
  private 
    def search_params
      params.require(:user).permit(:search)
    end
  

end
