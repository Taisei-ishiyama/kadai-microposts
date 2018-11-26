class LikesController < ApplicationController
  
  def index
    @microposts = current_user.like_microposts.order('created_at DESC').page(params[:page])
  end
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'この投稿をお気に入りに登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'この投稿のお気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
