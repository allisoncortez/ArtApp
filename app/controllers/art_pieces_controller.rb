class ArtPiecesController < ApplicationController
    before_action :redirect_if_not_logged_in
    def new
        @art_piece =ArtPiece.new 
    end

    def create
        @art_piece = current_user.art_pieces.build(art_params)
        if @art_piece.save
            redirect_to art_pieces_path
        else
            render :new
        end
    end

    private

    def art_params
        params.require(:art_piece).permit(:title, :social_handle)
    end
end
