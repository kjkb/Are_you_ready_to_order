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
  
  def destroy
    @map = Map.find(params[:id])
    @map.destroy
    redirect_to maps_path
  end

  def show
    @map = Map.find(params[:id])
    @post_comment = PostComment.new
  end

private

  def map_params
      params.require(:map).permit(:lat, :lng, :shop_name, :body, :image, :user_id, :peko, :cooking_genre)
  end

end
