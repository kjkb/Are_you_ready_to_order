class Public::UsersController < ApplicationController
  
  # def show
  #   @user = User.find_by(id: params[:id])
  #   @favorites = Favorite.where(user_id: @user.id)
  # end
def show
  favorites = Favorite.where(user_id: current_user.id).pluck(:map_id)
  @mark_list = Map.find(favorites)
end

end
