class DashboardsController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @post = Post.new  
    end
end
