class CommentsController < ApplicationController
  def index
    @comments = Comment.all.order(created_at: :desc)
  end

  def new
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.build()
    if comment.valid?
    else
    end
  end

  

  def destroy
  end

  private 
      def comments_params
        params.require(:comment).permit(:sub_content)
      end


end
