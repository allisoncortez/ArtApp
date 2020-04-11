class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:art_piece_id] && @art = ArtPiece.find_by_id(params[:art_piece_id])
            @comments = @art.comments
        else
            @error = "Oops! That art doesn't exist." if params[:art_piece_id]
            @comments = Comment.all 
        end
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_path
        else
            render :new
        end
    end

    def show
        @comment = Comment.find_by(id: params[:id])
    end 

    def edit
        @comment = Comment.find_by(id: params[:id])
    end

    def update
        @comment = Comment.find_by(id: params[:id])
        if @comment 
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
    end
end
