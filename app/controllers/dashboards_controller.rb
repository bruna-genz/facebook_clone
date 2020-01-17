class DashboardsController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @post = Post.new
        @posts = Post.all  
    end

    def profile
    end

    def friends_request
    end


end
