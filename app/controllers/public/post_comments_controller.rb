class Public::PostCommentsController < ApplicationController
  def create
    map = Map.find(params[:map_id])
    comment = PostComment.new(post_comment_params)
    comment.user_id = current_user.id
    comment.map_id = map.id
    comment.save
    redirect_to map_path(map)
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to map_path(params[:map_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
