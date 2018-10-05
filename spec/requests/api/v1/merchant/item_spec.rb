require 'rails_helper'

describe 'Merchant API' do
  describe 'merchant items' do
    it 'should show all tems for the merchants' do
      merchant = create(:merchant)
      items = create_list(:item,
                          3,
                          merchant_id: merchant.id)


      get "/api/v1/merchants/#{merchant.id}/items"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response.first["id"]).to eq(items.first.id)
    end
  end
end
