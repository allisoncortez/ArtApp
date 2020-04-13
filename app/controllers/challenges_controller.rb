class ChallengesController < ApplicationController

    def index
        @challenges = Challenge.all
    end

    def new
        @challenge = new
    end

    def create
    end

    def show
        @challenge = Challenge.find_by(id: params[:id])
    end

    private

    def challenge_params
        params.require(:challenge).permit(:name)
    end

end
