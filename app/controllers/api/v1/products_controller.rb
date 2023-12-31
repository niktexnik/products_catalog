module Api
  module V1
    class ProductsController < ::Api::ApplicationController
      def index
        result = Products::Index.run(params)
        if result.valid?
          render json: PaginationSerializer.new(result.result,
                                                each_serializer: Products::ProductSerializer, root: :products).as_json
        else
          render json: { message: result.errors.to_a }, status: :bad_request
        end
      end

      def show
        result = Products::Show.run(params)
        if result.valid?
          render json: result.result, status: :ok, serializer: Products::ProductSerializer
        else
          render json: { message: result.errors.to_a }, status: :bad_request
        end
      end

      def create
        result = Products::Create.run(params)
        if result.valid?
          render json: result.result, status: :ok, serializer: Products::ProductSerializer
        else
          render json: { message: result.errors.to_a }, status: :bad_request
        end
      end

      def update
        result = Products::Update.run(params)
        if result.valid?
          render json: result.result, status: :ok, serializer: Products::ProductSerializer
        else
          render json: { message: result.errors.to_a }, status: :bad_request
        end
      end

      def destroy
        result = Products::Destroy.run(params)
        if result.valid?
          head :no_content
        else
          render json: { message: result.errors.to_a }, status: :bad_request
        end
      end
    end
  end
end
