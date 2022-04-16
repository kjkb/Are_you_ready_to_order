class Public::FavoritesController < ApplicationController
  def create
    @map_favorite = Favorite.new(user_id: current_user.id, map_id: params[:map_id])
    @map_favorite.save
    redirect_to map_path(params[:map_id])
  end

  def destroy
    @map_favorite = Favorite.find_by(user_id: current_user.id, map_id: params[:map_id])
    @map_favorite.destroy
    redirect_to map_path(params[:map_id])
  end
end
