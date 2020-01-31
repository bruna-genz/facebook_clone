class PostsController < ApplicationController
  before_action :logged_in_user

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(posts_params)
    @posts = Post.all
    if @post.valid?
      @post.save
      flash[:success] = 'Post created'
      redirect_to root_path
    else
      render template: 'posts/index'
    end
  end

  def edit; end

  def update; end

  def index
    ids = current_user.friends.pluck(:id) << current_user.id
    @post = Post.new
    @posts = Post.where(creator_id: ids)
    @comment = Comment.new
  end

  def destroy; end

  private

  def posts_params
    params.require(:post).permit(:content)
  end

  def logged_in_user
    flash[:danger] = 'You must sign in.' unless user_signed_in?
    redirect_to new_content_path unless user_signed_in?
  end

  
end
