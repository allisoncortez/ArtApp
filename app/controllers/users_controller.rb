class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
        
            session[:user_id] = @user.id
        
            redirect_to user_path(@user)
        else
            # flash[:message] = "Invalid credentials, please try again."
            # redirect_to "/signup"
            render :new
            

        end
    end

    def show
        @user = User.find_by_id(params[:id])
        # redirect_to '/' if !@user
        redirect_if_not_logged_in
    end

    private

    def user_params
        params.require(:user).permit(:email, :first_name, :password, :art_work_id)
    end
end
