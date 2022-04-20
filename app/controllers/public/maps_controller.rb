class Public::MapsController < ApplicationController
  def index
    @maps = Map.all
  end

  def new
    @map = Map.new
  end

  def create
    @map = Map.new(map_params)
    @map.user_id = current_user.id
    if @map.save
     redirect_to maps_path
    else
     render :new
    end
  end

  def show
    @map = Map.find(params[:id])
  end


private

  def map_params
      params.require(:map).permit(:lat, :lng, :shop_name, :body, :image, :user_id, :peko, :cooking_genre)
  end

end
