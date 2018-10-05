require 'rails_helper'

describe 'Merchant API' do
  describe 'Find endpoints' do
    it "it can find a single merchant by id" do
      merchants = create_list(:merchant,
                            3)

      get "/api/v1/merchants/find?id=#{merchants.first.id}"

      expect(response).to be_successful

      merchant_response = JSON.parse(response.body)

      expect(merchant_response["id"]).to eq(merchants.first.id)
    end
    it "it can find a single merchant by name" do
      merchants = create_list(:merchant,
                            3)

      get "/api/v1/merchants/find?name=#{merchants.first.name}"

      expect(response).to be_successful

      merchant_response = JSON.parse(response.body)

      expect(merchant_response["id"]).to eq(merchants.first.id)
    end
    it "it can find a single merchant by created_at" do
      merchants = create_list(:merchant,
                            3,
                             created_at: '2017-01-01 00:00:00')

      get "/api/v1/merchants/find?created_at=#{merchants.first.created_at}"

      expect(response).to be_successful

      merchant_response = JSON.parse(response.body)

      expect(merchant_response["id"]).to eq(merchants.first.id)
    end
    it "it can find a single merchant by updated_at" do
      merchants = create_list(:merchant,
                            3,
                             updated_at: '2017-01-01 00:00:00')

      get "/api/v1/merchants/find?updated_at=#{merchants.first.updated_at}"

      expect(response).to be_successful

      merchant_response = JSON.parse(response.body)

      expect(merchant_response["id"]).to eq(merchants.first.id)
    end
  end
end
