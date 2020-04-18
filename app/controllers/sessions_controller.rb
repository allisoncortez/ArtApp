class SessionsController < ApplicationController
    def new
    end

    # def home
    # end

    def destroy
        session.clear
        redirect_to '/'
    end

    def create
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to challenges_path
        else
            flash[:message] = "Invalid credentials, please try again."
            redirect_to "/login"
        end
    end

    def github_login
        @user = User.find_or_create_by( uid: auth['uid']) do |u|
            u.first_name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex
        end

        session[:user_id] = @user.id
        # redirect_to user_path(@user)

        # @user = User.find_or_create_from_auth_hash(auth)
        # self.current_user = @user 
        redirect_to '/'

    end

    # private

    def auth
        request.env['omniauth.auth']
    end

end