require 'spec_helper'

# rubocop:disable AlignHash
describe Api::LineItemsController do
  render_views
  before { controller.class.skip_before_filter :authenticate_api! }
  let!(:customer) { create(:customer) }
  let!(:order) { create(:order, customer_id: customer.id) }
  let!(:order_with_line_items) { create(:order_with_line_items) }
  let!(:product) { create(:product) }
  let!(:line_item) { order_with_line_items.line_items.first }
  let(:line_item_attributes) do
    attributes_for(:line_item)
      .merge(order_id: order_with_line_items.id, product_id: product.id)
  end
  let(:line_item_keys) do
    %w(id order_id notes value quantity price product)
  end

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
      get :show, format: :json, order_id: order_with_line_items.id,
          id: line_item.id
    end

    it 'returns 200 code' do
      expect(response.status).to eq(200)
    end

    it 'returns correct hash keys' do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to eq(line_item_keys.map(&:to_s))
    end
  end

  describe 'POST #create' do
    it 'returns 201 code' do
      post :create, format: :json, order_id: order_with_line_items.id,
           line_item: line_item_attributes
      expect(response.status).to eq(201)
    end

    it 'increments the amount of order line items' do
      expected = expect do
        post :create,
             format: :json,
             order_id: order_with_line_items.id,
             line_item: line_item_attributes
      end
      expected.to change(LineItem, :count).by(1)
    end
  end

  describe 'PUT #update' do
    before do
      put :update, format: :json,
          order_id: order_with_line_items.id,
          id: line_item.id,
          line_item: line_item_attributes
    end

    it 'returns 204 code' do
      expect(response.status).to eq(204)
    end

    it 'updates the attribute in params' do
      expect(LineItem.find(line_item.id).notes)
        .to eq(line_item_attributes[:notes])
    end
  end

  describe 'DELETE #destroy' do
    it 'returns 204 code' do
      delete :destroy, format: :json, order_id: order_with_line_items.id,
             id: line_item.id
      expect(response.status).to eq(204)
    end

    it 'decrements the amount of order line items' do
      expected = expect do
        delete :destroy,
               format: :json,
               order_id: order_with_line_items.id,
               id: line_item.id
      end
      expected.to change(LineItem, :count).by(-1)
    end
  end
end
