class LikesController < ApplicationController
  def new
    @like = Like.new
  end
  
  def create
    @likes = current_user.likes.build
  end

  def destroy
  end

  private

    def likes_params
      params.require(:like).permit
    end
end
