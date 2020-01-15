class DashboardsController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @post = Post.new  
    end

    def profile
    end

    def friends_request
    end
end
