require 'rails_helper'

describe 'Customer API' do
  describe 'Random Endpoint' do
    it 'returns a random customer' do
      id = create(:customer).id

      get "/api/v1/customers/random"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer["id"]).to eq(id)
    end
  end
end
