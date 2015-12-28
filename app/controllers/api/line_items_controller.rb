class Api::LineItemsController < ApplicationController
  def index
    @line_items = LineItem.where(order_id: params[:order_id].to_i)
  end

  def show
    @line_item = LineItem.find(params[:id])
  end

  def create
    order = Order.find(params[:order_id])
    line_item = order.line_items.new

    if line_item.update(line_item_params)
      render nothing: true, status: 201
    else
      render json: { errors: line_item.errors }
    end
  end

  private 
  def line_item_params
    attributes =
       [:order_id,
        :product_id,
        :notes,
        :value,
        :quantity]
    params.require(:line_item).permit(attributes)
  end
end
