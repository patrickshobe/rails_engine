require 'rails_helper'

describe 'Merchant API' do
  describe 'Random Endpoint' do
    it 'returns a random Merchant' do
      id = create(:merchant).id

      get "/api/v1/merchants/random"

      expect(response).to be_successful

      merchant = JSON.parse(response.body)

      expect(merchant["id"]).to eq(id)
    end
  end
end
