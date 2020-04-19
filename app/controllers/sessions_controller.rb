class SessionsController < ApplicationController
    # skip_before_action :current_user, only: [:new, :create]

    def new
        @user = User.new
    end

    # def home
    # end

    def destroy
        session.clear
        redirect_to '/'
    end

    # def create
    #     user = User.find_by(email: params[:user][:email])
    #     if user && user.authenticate(params[:user][:password])
    #         session[:user_id] = user.id
    #         redirect_to challenges_path
    #     else
    #         flash[:message] = "Invalid credentials, please try again."
    #         redirect_to "/login"
    #     end
    # end

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
    

    # def create
    #     if auth_hash
    #       if user = User.find_by(email: auth_hash["info"]["email"])
    #         session[:user_id] = user.id
    #         redirect_to user_path(user)
    #       else
    #         user = User.create(email: auth_hash["info"]["email"], first_name: auth_hash["info"]["name"], password: SecureRandom.hex)
    #         session[:user_id] = user.id
    #         redirect_to user_path(user)
    #       end 
    #     else
    #         if @user = User.find_by(email: params[:user][:email])
    #            if  @user.authenticate(params[:user][:password])
    #                 session[:user_id] = @user.id 
    #                 redirect_to user_path(@user)
    #             else 
    #                 flash[:alert] = "Your login credentials were incorrect. Please try again."
    #                 redirect_to login_path
    #             end
    #         else
    #             flash[:alert] = "Your login credentials were incorrect. Please try again." 
    #             redirect_to login_path
    #         end
            
    #     end 
    # end

    # def github_login
        
    #     @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #     # @user = User.find_or_create_by(:email => auth['info']['email']) do |u|
            
    #         u.first_name = auth['info']['name']
    #         u.email = auth['info']['email']
    #         u.password = SecureRandom.hex
    #         # u.id = auth['extra']['raw_info']['id']
    #         # u.uid = auth['uid']
            
    #     end
        
    #     # if @user.save
       
    #         session[:user_id] = @user.id
    #         redirect_to '/'
    #     # else
    #         # redirect_to '/login'
    #     # binding.pry
    #     # end
    # end

    # def facebook_login
    #     @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #         u.first_name = auth['info']['name']
    #         u.email = auth['info']['email']
    #         # u.image = auth['info']['image']
    #         u.password = SecureRandom.hex
    #       end
    #     #   
    #     # binding.pry
    #       session[:user_id] = @user.id
          
    #     #   render '/'
    #       render 'sessions/home'
    #     end

    # private

    def auth
        request.env['omniauth.auth']
    end
end