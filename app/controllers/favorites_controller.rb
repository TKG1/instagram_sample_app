class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(post_id: params[:post_id])
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
