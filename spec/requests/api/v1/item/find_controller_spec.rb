require 'rails_helper'

describe 'Items API' do
  describe 'Find endpoints' do
    it "it can find a single item by id" do
      merchant = create(:merchant)
      item = create(:item,
                    merchant_id: merchant.id)

      get "/api/v1/items/find?id=#{item.id}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response["id"]).to eq(item.id)
    end
    it "it can find a single item by name" do
      merchant = create(:merchant)
      item = create(:item,
                    merchant_id: merchant.id)

      get "/api/v1/items/find?name=#{item.name}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response["id"]).to eq(item.id)
    end
    it "it can find a single item by description" do
      merchant = create(:merchant)
      item = create(:item,
                    merchant_id: merchant.id)

      get "/api/v1/items/find?description=#{item.description}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response["id"]).to eq(item.id)
    end
    it "it can find a single item by unit_price" do
      merchant = create(:merchant)
      item = create(:item,
                    merchant_id: merchant.id)

      get "/api/v1/items/find?unit_price=#{item.unit_price}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response["id"]).to eq(item.id)
    end
    it "it can find a single item by merchant_id" do
      merchant = create(:merchant)
      item = create(:item,
                    merchant_id: merchant.id)

      get "/api/v1/items/find?merchant_id=#{item.merchant_id}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response["id"]).to eq(item.id)
    end
    it "it can find a single item by created_at" do
      merchant = create(:merchant)
      item = create(:item,
                    merchant_id: merchant.id,
                   created_at: '2017-01-01 00:00:00')

      get "/api/v1/items/find?created_at=#{item.created_at}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response["id"]).to eq(item.id)
    end
    it "it can find a single item by updated_at" do
      merchant = create(:merchant)
      item = create(:item,
                    merchant_id: merchant.id,
                   updated_at: '2017-01-01 00:00:00')

      get "/api/v1/items/find?updated_at=#{item.updated_at}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response["id"]).to eq(item.id)
    end
  end
end
