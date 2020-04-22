class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @art_work = ArtWork.find_by_id(params[:art_work_id])
        @comment = @art_work.comments.build

    end

    def create
        @comment = current_user.comments.build(comment_params)
        @art_work = @comment.art_work
        
        if @comment.save
            redirect_to art_work_path(@art_work)
            #@comment.art_work
        else
            render :new
        end
    end

    # def show
    #     # @comment = Comment.find_by(id: params[:id])
    # end 

    # def edit
    #     # @comment = Comment.find_by_id(params[:id])
        
    # end


    # def update
    #     # @comment = Comment.find_by(id: params[:id])
    #     # @art_work = @comment.art_work
    
    #     # if @comment.update(comment_params)
    #     #     redirect_to art_work_path(@art_work)
    #     # else 
    #     #     render :edit 
    #     # end
    # end

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

end
