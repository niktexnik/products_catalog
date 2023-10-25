class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    result = Products::Index.run(params)
    if result.valid?
      render json: PaginationSerializer.new(result.result,
                                            each_serializer: Products::ProductSerializer, root: :products).as_json
    else
      render json: result.errors.details, status: :bad_request
    end
  end

  def show
    result = Products::Show.run(params)
    if result.valid?
      render json: result.result, status: :ok, each_serializer: Products::ProductSerializer
    else
      render json: result.errors.details, status: :bad_request
    end
  end

  def update
    result = Products::Update.run(params)
    if result.valid?
      render json: result.result, status: :ok, serializer: Products::ProductSerializer
    else
      render json: result.errors.details, status: :bad_request
    end
  end

  def create
    result = Products::Create.run(params)
    if result.valid?
      render json: result.result, status: :ok, serializer: Products::ProductSerializer
    else
      render json: result.errors.details, status: :bad_request
    end
  end

  def destroy
    result = Products::Destroy.run(params)
    if result.valid?
      render json: 'Successfully', status: :no_content
    else
      render json: result.errors.details, status: :bad_request
    end
  end
end
