class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    # before_action :set_comment, only: [:show, :edit, :update, :destroy]

    def index
        # # first, check if it's nested.. && if we can successfully find that art.. STEP3: it will set the @art value if found.
        # if params[:art_work_id] && @art_work = ArtWork.find_by_id(params[:art_work_id])
        #     @comments = @art_work.comments
        # else
        #     # flash[:message] = "Oops! That art doesn't exist." ..we would need to redirect to something, if we use flash here..
        #     @error = "Oops! That art doesn't exist." if params[:art_work_id]
        
        #     @comments = Comment.all 
        # end
    end

    def new
        @art_work = ArtWork.find_by_id(params[:art_work_id])
        @comment = @art_work.comments.build

    end

    def create
        @comment = current_user.comments.build(comment_params)
        @art_work = @comment.art_work
        
        if @comment.save
            redirect_to art_work_path(@art_work)
        else
            render :new
        end
    end

    def show
        # @comment = Comment.find_by(id: params[:id])
    end 

    def edit
        # @comment = Comment.find_by_id(params[:id])
        
    end


    def update
        # @comment = Comment.find_by(id: params[:id])
        # @art_work = @comment.art_work
    
        # if @comment.update(comment_params)
        #     redirect_to art_work_path(@art_work)
        # else 
        #     render :edit 
        # end
    end

    def destroy
        @comment = Comment.find_by(id: params[:id])
        @art_work = @comment.art_work
       
        @comment.destroy
        redirect_to art_work_path(@art_work)
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :art_work_id, :user_id)
    end

    def set_comment
        @comment = Comment.find_by(id: params[:id])
        # @art_work = @comment.art_work
        # if !@comment
        #     flash[:message] = "Comment not found"
        #     redirect_to art_work_path(@art_work)
        # end
    end
end
