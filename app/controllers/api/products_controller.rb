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
      render json: product
    else
      #render json: product.errors.messages, status: :bad_request
      respond_with(@product, :location => products_url)
    end
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product
    else
      respond_with(@product, :location => products_url)
    end
  end

  def product_params
    attributes = [
      :name,
      :description,
      :profit,
      :price
    ]
    params.require(:product).permit(attributes)
  end
end
