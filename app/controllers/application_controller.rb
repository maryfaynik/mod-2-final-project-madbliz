class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :current_user

    
    def current_user
        @cuser = (User.find_by(id: session[:user_id]) || User.new)
    end
    helper_method :current_user

    def this_user?
        @user == current_user
    end
    helper_method :this_user?
    
    def logged_in?
      current_user.id != nil
    end
  
    def require_logged_in
        unless logged_in?
            flash[:errors] ||= []
            flash[:errors] << "Must be signed in to view this content"
            # byebug
            session[:redirect_to] ||= request.referer
            redirect_to login_path
        end
    end

    

    def splash
        logged_in? ? (redirect_to user_path(current_user.id)) : (redirect_to login_path)
    end
end
