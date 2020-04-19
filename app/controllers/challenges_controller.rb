class ChallengesController < ApplicationController

    def index
        @challenges = Challenge.all.alpha
    end

    # def new
    #     @challenge = Challenge.new
    # end

    # def create
    # end

    def show
        @challenge = Challenge.find_by(id: params[:id])
    end

    private

    def challenge_params
        params.require(:challenge).permit(:name, :instructions, :image, :art_work_id)
    end

end
