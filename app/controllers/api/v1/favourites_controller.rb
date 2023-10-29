module Api
  module V1
    class FavouritesController < ::Api::ApplicationController
      def create
        result = ::Favourites::Create.run(params)
        if result.valid?
          render json: 'Success', status: :ok
        else
          render json: { message: result.errors.to_a }, status: :bad_request
        end
      end

      def destroy
        result = ::Favourites::Destroy.run(params)
        if result.valid?
          head :no_content
        else
          render json: { message: result.errors.to_a }, status: :bad_request
        end
      end
    end
  end
end
