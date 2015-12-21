require 'spec_helper'
describe Api::CustomersController do
  let!(:customer) { create(:customer) }
  let!(:customer_keys) { %w(id first_name last_name description tax_identification_number email phone_number fax_number address
 zip_code city www note discount) }

  describe "GET #index" do
    before do
      get :index, format: :json
      @json_response = JSON.parse(response.body)
    end

    it "returns 200 code" do
      expect( response.status ).to eq 200
    end

    it "contains current fields" do
      expect(@json_response.first.keys).to eq(customer_keys)
    end
  end
end
