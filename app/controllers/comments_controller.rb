class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.build(posts_params)
        @posts = Post.all.order(created_at: :desc)
        if @post.valid?
            @post.save
            flash[:success] = "Post created"
            redirect_to root_path
        else
            render :template => 'posts/index'          
        end
  end

  def destroy
  end
end
