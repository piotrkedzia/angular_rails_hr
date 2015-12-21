require 'spec_helper'

describe Api::LineItemsController do
# render_views
  before { controller.class.skip_before_filter :authenticate_api! }
  let!(:customer) { create(:customer) }
  let!(:order) { create(:order, customer_id: customer.id) }
  let!(:order_with_line_items)
  let!(:product) { create(:product) }

  let(:line_item_attributes) do
    attributes_for(:line_item).merge(order_id: order.id, product_id: product.id)
  end
  let(:line_item_keys) { [:id, :order_id, :product_id, :notes, :value, :quantity] }

  describe 'GET #index' do
    before do
      get :index, format: :json, order_id: order_with_line_items.id
    end

    it 'returns 200 code' do
      expect(response.status).to eq(200)
    end

    it 'returns all order line items' do
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(order_with_line_items.line_items.count)
    end
  end

  describe 'GET #show' do
    before do
      get :show, format: :json, order_id: order_with_line_items.id, id: order_with_line_items.line_items.first.id
    end

    it 'returns 200 code' do
      expect(response.status).to eq(200)
    end

    it 'returns correct hash keys' do
      json_resposne = response.body
      expect(json_response.keys).to eq(line_item_keys.map(&:to_s))
    end
  end

  describe 'POST #create' do
    it 'returns 201 code' do
      post :create, format: :json, line_item: line_item_attributes
      expect(response.status).to eq(201)
    end

    it 'increments the amount of order line items' do
      expect { post :create, format: :json, line_item: line_item_attributes }
        .to change(LineItem, :count).by(1)
    end
  end

  describe 'PUT #update' do
    before do
      put :update, order_id: order_with_line_items.id, line_item_id: order_with_line_items.line_items.first.id, format: :json, line_item:LLL 
    end

    it 'returns 204 code' do
      expect(response.status).to eq(204)
    end

    it 'updates the attribute in params' do
      expect(Membership.find(membership.id).billable).to be true
    end
  end

  describe 'DELETE #destroy' do
    it 'returns 204 code' do
      delete :destroy, id: membership.id, format: :json
      expect(response.status).to eq(204)
    end

    it 'decrements the amount of memberships' do
      expect { delete :destroy, id: any_membership, format: :json }
        .to change(Membership, :count).by(-1)
    end
  end
end
