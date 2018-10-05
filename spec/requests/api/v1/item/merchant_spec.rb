require 'rails_helper'

describe 'Items API' do
  describe 'Items merchants' do
    it 'should show all merchants for the item ' do
      merchant = create(:merchant)
      item = create(:item,
                    merchant_id: merchant.id)

      get "/api/v1/items/#{item.id}/merchants"

      expect(response).to be_successful

      merchant_response = JSON.parse(response.body)

      expect(merchant_response["id"]).to eq(merchant.id)
    end
  end
end
