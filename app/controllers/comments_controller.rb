class CommentsController < ApplicationController
  def index
    @comments = Comment.all.order(created_at: :desc)
  end

  def new
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.build(comments_params)
    if @comment.valid?
      @comment.save
      flash[:success] = "Comment created"
    else
      flash[:danger] = "It was not possible to create this comment"
    end
    redirect_to root_path
  end

  def destroy
    @comment.destroy
  end

  private 
      def comments_params
        params.require(:comment).permit(:sub_content, :post_id)
      end
end
