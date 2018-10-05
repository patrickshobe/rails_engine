require 'rails_helper'

describe 'Item API' do
  describe 'Random Endpoint' do
    it 'returns a random item' do
      merchant = create(:merchant)
      id = create(:item,
                    merchant_id: merchant.id).id

      get "/api/v1/items/random"

      expect(response).to be_successful

      item = JSON.parse(response.body)

      expect(item["id"]).to eq(id)
    end
  end
end
