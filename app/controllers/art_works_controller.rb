class ArtWorksController < ApplicationController
    before_action :redirect_if_not_logged_in
    # before_action :set_art_work, except: [:index, :new, :create]

    def index
        # first, check if it's nested
        if params[:user_id] && current_user = User.find_by_id(params[:user_id])
            @art_works = current_user.art_works
        else
            # flash[:message] = "Oops! That art doesn't exist." ..we would need to redirect to something, if we use flash here..
            @error = "Oops! That user doesn't exist." if params[:user_id]
            @art_works = ArtWork.all 
        end
    end

    def new
        if params[:challenge_id] && @challenge = Challenge.find_by_id(params[:challenge_id])
            @art_work = @challenge.art_works.build
        else
          @error = "Oops! That challenge doesn't exist." if params[:challenge_id]
          @art_work = ArtWork.new  
        end
    end

    def create
        
        @art_work = current_user.art_works.build(art_work_params)
        if @art_work.save
            redirect_to art_work_path(@art_work), notice: "Artwork uploaded successfully"
            # artwork index path: challenge_art_works_path(@art_work)
        else
            render :new
        end
    end

    def show
        #does the artwork exist
        #does it have matching ids
        @art_work = ArtWork.find_by(id: params[:id])
    end 

    def edit
        @art_work = ArtWork.find_by(id: params[:id])
        # if @art_work.user_id != current_user.id 
        #     flash[:error] = "Oops, you can't edit this."
        #     redirect_to home_path
        # end
    end

    def update
        @art_work = ArtWork.find_by(id: params[:id])
        if @art_work.update(art_work_params)
            redirect_to art_work_path
        else 
            render :edit 
        end
    end

    def destroy
        @art_work = ArtWork.find_by(id: params[:id])
        @art_work.destroy
        redirect_to art_works_path
    end

    private

    def art_work_params
        params.require(:art_work).permit(:title, :challenge_id, :user_id, :social_handle, :image, :description)
    end

    # def set_art_work
    #     @art_work = Artwork.find_by(id: params[:id])
    # end
end
