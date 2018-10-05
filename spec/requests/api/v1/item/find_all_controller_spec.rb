require 'rails_helper'

describe 'Items API' do
  describe 'Find all endpoints' do
    it "it can finds all item by id" do
      merchant = create(:merchant)
      items = create_list(:item,
                          3,
                    merchant_id: merchant.id)

      get "/api/v1/items/find_all?id=#{items.first.id}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response.first["id"]).to eq(items.first.id)
    end
    it "it can finds all item by name" do
      merchant = create(:merchant)
      items = create_list(:item,
                          3,
                    merchant_id: merchant.id)

      get "/api/v1/items/find_all?name=#{items.first.name}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response.first["id"]).to eq(items.first.id)
    end
    it "it can finds all item by description" do
      merchant = create(:merchant)
      items = create_list(:item,
                          3,
                    merchant_id: merchant.id)

      get "/api/v1/items/find_all?description=#{items.first.description}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response.first["id"]).to eq(items.first.id)
    end
    it "it can finds all item by unit_price" do
      merchant = create(:merchant)
      items = create_list(:item,
                          3,
                    merchant_id: merchant.id)

      get "/api/v1/items/find_all?unit_price=#{items.first.unit_price}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response.first["id"]).to eq(items.first.id)
    end
    it "it can finds all item by merchant_id" do
      merchant = create(:merchant)
      items = create_list(:item,
                          3,
                    merchant_id: merchant.id)

      get "/api/v1/items/find_all?merchant_id=#{items.first.merchant_id}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response.first["id"]).to eq(items.first.id)
    end
    it "it can finds all item by created_at" do
      merchant = create(:merchant)
      items = create_list(:item,
                          3,
                    merchant_id: merchant.id,
                   created_at: '2017-01-01 00:00:00')

      get "/api/v1/items/find_all?created_at=#{items.first.created_at}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response.first["id"]).to eq(items.first.id)
    end
    it "it can finds all item by updated_at" do
      merchant = create(:merchant)
      items = create_list(:item,
                          3,
                    merchant_id: merchant.id,
                   updated_at: '2017-01-01 00:00:00')

      get "/api/v1/items/find_all?updated_at=#{items.first.updated_at}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response.first["id"]).to eq(items.first.id)
    end
  end

end
