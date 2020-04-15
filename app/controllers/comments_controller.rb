class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        # first, check if it's nested.. && if we can successfully find that art.. STEP3: it will set the @art value if found.
        if params[:art_work_id] && @art_work = ArtWork.find_by_id(params[:art_work_id])
            @comments = @art_work.comments
        else
            # flash[:message] = "Oops! That art doesn't exist." ..we would need to redirect to something, if we use flash here..
            @error = "Oops! That art doesn't exist." if params[:art_work_id]
        
            @comments = Comment.all 
        end
    end

    def new
       @art_work = ArtWork.find_by_id(params[:art_work_id])

        @comment = @art_work.comments.build

    end

    def create
        
        @comment = current_user.comments.build(comment_params)
        # @art_work = ArtWork.find_by_id(params[:art_work_id])
        if @comment.save
            redirect_to art_work_path(@art_work)
            # redirect_to comments_path
        else
            render :new
        end
    end

    def show
        @comment = Comment.find_by(id: params[:id])
    end 

    def edit
        @comment = Comment.find_by(id: params[:id])
        
        if @comment.user_id != current_user.id 
            flash[:message] = "Oops, you can't edit this."
            redirect_to challenge_path
        end

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
        params.require(:comment).permit(:content, :art_work_id)
    end
end
