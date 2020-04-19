class SessionsController < ApplicationController
    # skip_before_action :current_user, only: [:new, :create]

    def new
        @user = User.new
    end

    #works for regular users
    def create
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to challenges_path
        else
            #should just render :new
            flash[:message] = "Invalid credentials, please try again."
            redirect_to "/login"
        end
    end


    #facebook login that works
    def facebook_login
        if params[:first_name]
            @user = User.find_by(first_name: params[:first_name])
            if @user && @user.authenticate(params[:password])
                log_in(@user)
            else
                render '/login'
            end
        else
            if @user = User.find_by(email: auth[:info]['email'])
                log_in(@user)
            else
                @user = User.new(email: auth[:info]['email'], first_name: auth[:info]['name'], password: SecureRandom.hex, uid: auth['uid'] )
                  if @user.save
                    log_in(@user)
                  else
                    render :new
                  end
            end
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end