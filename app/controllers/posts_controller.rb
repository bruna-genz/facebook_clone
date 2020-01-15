class PostsController < ApplicationController
    before_action :logged_in_user

    def new
        @post = Post.new
        render 'dashboards/show'  
    end

    def create
        @post = current_user.posts.build(posts_params)
        if @post.valid?
            @post.save
            flash[:success] = "Post created"
        else
            render 'new'
        end
    end

    def edit
        
    end

    def update
    end

    def index
    end

    def destroy
    end

    private 

        def posts_params
            params.require(:post).permit(:content)
        end

        def logged_in_user
            flash[:danger] = "You must sign in." unless user_signed_in?
            redirect_to new_users_session_path unless user_signed_in?
        end

end
