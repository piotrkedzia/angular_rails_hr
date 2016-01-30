class Api::LineItemsController < ApplicationController
  def index
    @line_items = LineItem.includes(:product).where(order_id: params[:order_id].to_i)
  end

  def show
    @line_item = LineItem.find(params[:id])
  end

  def create
    order = Order.find(params[:order_id])
    line_item = order.line_items.build(line_item_params)

    if line_item.save
      render nothing: true, status: 201
    else
      render json: { errors: line_item.errors }, status: 422
    end
  end

  def update
    line_item = LineItem.find(params[:id])
    line_item.update_attributes(line_item_params)

    if line_item.save
      render nothing: true, status: 204
    else
      render json: { errors: line_item.errors }, status: 422
    end
  end

  def destroy
    line_item = LineItem.find(params[:id])

    if line_item.destroy
      render nothing: true, status: 204
    else
      render json: { errors: line_item.errors }, status: 422
    end
  end

  private
  def line_item_params
    attributes =
       [:order_id,
        :product_id,
        :notes,
        :value,
        :quantity,
        :price]
    params.require(:line_item).permit(attributes)
  end
end
