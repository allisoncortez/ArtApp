class ArtWorksController < ApplicationController
    before_action :redirect_if_not_logged_in
    def new
        @artwork =ArtWork.new 
    end

    def create
        @artwork = current_user.artwork.build(art_params)
        if @artwork.save
            redirect_to artwork_path
        else
            render :new
        end
    end

    def show
        @artwork = ArtWork.find_by(id: params[:id])
    end 

    private

    def art_params
        params.require(:artwork).permit(:title, :social_handle)
    end
end
