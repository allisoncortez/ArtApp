class ArtWorksController < ApplicationController
    before_action :redirect_if_not_logged_in
    def new
        @art_work = ArtWork.new  
    end

    def create
        @art_work = current_user.art_works.build(art_work_params)
        if @art_work.save
            redirect_to art_work_path
        else
            render :new
        end
    end

    def show
        @art_work = ArtWork.find_by(id: params[:id])
    end 

    def edit
        @art_work = Artwork.find_by(id: params[:id])
    end

    def update
        @art_work = ArtWork.find_by(id: params[:id])
        if @art_work.update(art_work_params)
            redirect_to art_work_path(@art_work)
        else 
            render :edit 
        end
    end

    def destroy
        @art_work = ArtWork.find(params[:id])
        @art_work.destroy
        redirect_to art_works_path
    end

    private

    def art_work_params
        params.require(:art_work).permit(:title, :social_handle)
    end
end
