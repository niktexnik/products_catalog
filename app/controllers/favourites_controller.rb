class FavoritesController < ApplicationController
  def create
    result = ::Favorites::Create(product_id: params[:product_id], user_id: current_user.id)
    if result.valid?
      render json: 'Success', status: :ok, serializer: FavoriteSerializer
    else
      render json: result.errors.details, status: :bad_request, serializer: FavoriteSerializer
    end
  end

  def destroy
    result = ::Favorites::Destroy(product_id: params[:product_id], user_id: current_user.id)
    if result.valid?
      render json: { message: 'Success' }, status: :ok, serializer: FavoriteSerializer
    else
      render json: result.errors.details, status: :bad_request, serializer: FavoriteSerializer
    end
  end
end
