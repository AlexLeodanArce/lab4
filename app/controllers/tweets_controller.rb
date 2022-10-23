class TweetsController < ApplicationController
    def index
        @tweets= Tweet.all.order(created_at: :desc)
    end

    def show
        @tweet= Tweet.find(params[:id])
    end

    def new
        @tweet= Tweet.new
    end

    def create
        @tweet= Tweet.new(tweet_params)
        if @tweet.save
            redirect_to tweet_path(@tweet), notice: "Tweet guardado"
        else
            render :new, status: :see_other
        end
    end

private
    def tweet_params
        params.require(:tweet).permit(:monster_id,:content)
    end
end
