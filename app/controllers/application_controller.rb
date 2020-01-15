class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception


    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthday, :gender])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birthday, :gender])
    end

    private
    
        #def authenticate_user!
        #    unless user_signed_in?
        #        redirect_to new_content_path
        #    end
        #end
end
