class SessionsController < ApplicationController
    # skip_before_action :current_user, only: [:new, :create]

    def new
        @user = User.new
    end

    #facebook
    # def create
    #     @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #                 u.first_name = auth['info']['name']
    #                 u.email = auth['info']['email']
    #                 # u.image = auth['info']['image']
    #                 u.password = SecureRandom.hex
    #               end
    #             #   
    #             # binding.pry
    #               session[:user_id] = @user.id
                  
    #             #   render '/'
    #               redirect_to '/'
                
    # end

    def create
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