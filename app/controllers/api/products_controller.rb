class Api::ProductsController < ApplicationController
  respond_to :json

  def index
    serialized_products =
      ActiveModel::ArraySerializer
                .new(Product.all, each_serializer: ProductSerializer)

    render json: serialized_products
  end

  def update
    product = Product.find(params[:id])

    if product.update(product_params)
      render json: product, status: 200
    else
      #render json: product.errors.messages, status: :bad_request
      render json: {errors: product.errors}, status: 422
    end
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: 200
    else
      render json: {errors: product.errors}, status: 422
    end
  end

  def product_params
    attributes = [
      :id,
      :name,
      :description,
      :profit,
      :price,
      :image_url
    ]
    params.require(:product).permit(attributes)
  end
end
