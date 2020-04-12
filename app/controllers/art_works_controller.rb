class ArtWorksController < ApplicationController
    before_action :redirect_if_not_logged_in
    def new
        @art_work = ArtWork.new  
    end

    def create
        @art_work = current_user.art_work.build(art_work_params)
        if @art_work.save
            redirect_to art_work_path
        else
            render :new
        end
    end

    def show
        @art_work = ArtWork.find_by(id: params[:id])
    end 

    private

    def art_work_params
        params.require(:art_work).permit(:title, :social_handle)
    end
end
