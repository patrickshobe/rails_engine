require 'rails_helper'

describe 'Merchant API' do
  describe 'Find all endpoints' do
    it "it can find all merchant by id" do
      merchants = create_list(:merchant,
                            3)

      get "/api/v1/merchants/find_all?id=#{merchants.first.id}"

      expect(response).to be_successful

      merchant_response = JSON.parse(response.body)

      expect(merchant_response.first["id"]).to eq(merchants.first.id)
    end
    it "it can find all merchant by name" do
      merchants = create_list(:merchant,
                            3)

      get "/api/v1/merchants/find_all?name=#{merchants.first.name}"

      expect(response).to be_successful

      merchant_response = JSON.parse(response.body)

      expect(merchant_response.first["id"]).to eq(merchants.first.id)
      expect(merchant_response.length).to eq(3)
    end
    it "it can find all merchant by created_at" do
      merchants = create_list(:merchant,
                            3,
                             created_at: '2017-01-01 00:00:00')

      get "/api/v1/merchants/find_all?created_at=#{merchants.first.created_at}"

      expect(response).to be_successful

      merchant_response = JSON.parse(response.body)

      expect(merchant_response.first["id"]).to eq(merchants.first.id)
      expect(merchant_response.length).to eq(3)
    end
    it "it can find all merchant by updated_at" do
      merchants = create_list(:merchant,
                            3,
                             updated_at: '2017-01-01 00:00:00')

      get "/api/v1/merchants/find_all?updated_at=#{merchants.first.updated_at}"

      expect(response).to be_successful

      merchant_response = JSON.parse(response.body)

      expect(merchant_response.first["id"]).to eq(merchants.first.id)
      expect(merchant_response.length).to eq(3)
    end
  end
end
