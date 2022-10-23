class MonstersController < ApplicationController
  def index
    @monsters = Monster.all.order(:id)
  end

  def show
    @monster = Monster.find(params[:id])
    if Tweet.where(monster_id: @monster.id).size < 1
      redirect_to "/tweets/new", notice: "Cree un tweet"
    end
  end
end
