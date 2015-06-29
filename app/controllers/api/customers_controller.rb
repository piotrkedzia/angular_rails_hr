class Api::CustomersController < ApplicationController
  respond_to :json

  def index
    serialized_customers =
      ActiveModel::ArraySerializer
                  .new(Customer.all, each_serializer: CustomerSerializer)

   render json: serialized_customers
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      render json: customer
    else
      render json: customer.errors.messages, status: :bad_request
    end
  end

  def create
    customer = Customer.new(customer_params)
    if customer.save
      render json: customer
    else
      render json: customer.errors.messages, status: :bad_request
    end
  end

  private
  def customer_params
    attributes = [
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :address,
      :zip_code,
      :city
    ]
    params.require(:customer).permit(attributes)
  end
end
