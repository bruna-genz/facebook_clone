class DashboardsController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @post = Post.new
        @posts = Post.all.order(created_at: :desc)
    end

    def profile
    end

    def friends_request
    end


end
