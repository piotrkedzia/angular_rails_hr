class Api::CustomersController < ApplicationController
  respond_to :json

  def index
    serialized_customers =
      ActiveModel::ArraySerializer
                  .new(Customer.all, each_serializer: CustomerSerializer)

   render json: serialized_customers
  end
end
