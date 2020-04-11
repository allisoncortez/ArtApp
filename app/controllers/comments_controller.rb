class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        # first, check if it's nested.. && if we can successfully find that art.. STEP3: it will set the @art value if found.
        if params[:art_piece_id] && @art = ArtPiece.find_by_id(params[:art_piece_id])
            @comments = @art.comments
        else
            # flash[:message] = "Oops! That art doesn't exist." ..we would need to redirect to something, if we use flash here..
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
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else 
            render :edit 
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :art_piece_id)
    end
end
