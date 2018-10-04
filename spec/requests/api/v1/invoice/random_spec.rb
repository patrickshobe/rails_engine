require 'rails_helper'

describe 'Invoice API' do
  describe 'Random Endpoint' do
    it 'returns a random invoice' do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                     merchant_id: merchant.id,
                     customer_id: customer.id)
      id = create(:transaction, invoice_id: invoice.id).id

      get "/api/v1/invoices/random"

      expect(response).to be_successful

      invoice = JSON.parse(response.body)

      expect(invoice["id"]).to eq(id)
    end
  end
end
