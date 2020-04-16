class SessionsController < ApplicationController
    def new
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    def create
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:message] = "Invalid credentials, please try again."
            redirect_to "/login"
        end
    end

end