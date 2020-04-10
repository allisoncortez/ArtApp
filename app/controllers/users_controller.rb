class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            #log them in
            session[:user_id] = @user.id
            #redirect to showpage
            redirect_to 
        else
            render :new
        end
    end

    def show
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
