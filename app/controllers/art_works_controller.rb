class ArtWorksController < ApplicationController
    before_action :redirect_if_not_logged_in, except: [:index, :show]
    before_action :set_art_work, except: [:index, :new, :create]


    def title
       
        @art_work = ArtWork.all.title
        
        
    end

    def index
        @user = User.find_by_id(params[:user_id])
        @art_works = @user.art_works    
    end

    def new
        if params[:challenge_id] && @challenge = Challenge.find_by_id(params[:challenge_id])
            @art_work = @challenge.art_works.build
        else
          @art_work = ArtWork.new  
        end
    end

    def create
        @art_work = current_user.art_works.build(art_work_params)
        if @art_work.save
            redirect_to art_work_path(@art_work)
        else
            render :new
        end
    end

    def show
    end 

    def edit
          @challenge = @art_work.challenge
        if @art_work.user_id != current_user.id 
            flash[:message] = "Oops, you can't edit this."
            redirect_to challenge_path(@challenge)
        end
    end

    def update
        if @art_work.update(art_work_params)
            redirect_to art_work_path(@art_work)
        else 
            render :edit 
        end
    end

    def destroy
        @challenge = @art_work.challenge
       
        @art_work.destroy
        redirect_to challenge_path(@challenge)
    end

    private

    def art_work_params
        params.require(:art_work).permit(:title, :challenge_id, :user_id, :social_handle, :image, :description)
    end

    def set_art_work
        @art_work = ArtWork.find_by(id: params[:id])
    end
end
