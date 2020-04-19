class ApplicationController < ActionController::Base
    # gives access to theses methods in the views
    helper_method :current_user, :logged_in?

    private
    def current_user
        # @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        @user = User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end

    def log_in(user)
        session[:user_id] = user.id
        redirect_to user_path(user)    
    end
end
