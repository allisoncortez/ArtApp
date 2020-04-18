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
            redirect_to @user
        else
            flash[:message] = "Invalid credentials, please try again."
            redirect_to "/signup"
            # render :new
        end
    end

    def show
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end

    private

    def user_params
        params.require(:user).permit(:email, :first_name, :password, :art_work_id)
    end
end
