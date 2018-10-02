require 'rails_helper'

describe 'Transaction API' do
  describe 'Random Endpoint' do
    it 'returns a random transaction' do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                     merchant_id: merchant.id,
                     customer_id: customer.id)
      id = create(:transaction, invoice_id: invoice.id).id

      get "/api/v1/transactions/random"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction["id"]).to eq(id)
    end
  end
end
