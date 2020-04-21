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
        if !logged_in?
            flash[:message] = "Oops, you're not logged in."
            redirect_to '/' 
        end
    end

    def log_in(user)
        session[:user_id] = user.id
        # redirect_to user_path(user)    
        redirect_to challenges_path
    end
end
