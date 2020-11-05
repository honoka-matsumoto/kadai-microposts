class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  #def index
    #@favorites = Favorite.order(id: :desc).page(params[:page]).per(25)
  #end
  
  def create
    micropost = Micropost.find(params[:like_id])
    current_user.like(micropost)
    flash[:success] = 'お気に入りしました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:like_id])
    current_user.unlike(micropost)
    flash[:success] = 'お気に入りを外しました'
    redirect_back(fallback_location: root_path)
  end
end
