class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to picture_path(favorite.picture_id)
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id])
    picture_id = favorite.picture_id
    if favorite.destroy
      redirect_to picture_path(picture_id)
    end
  end
end
