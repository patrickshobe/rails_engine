require 'rails_helper'

describe 'Invoice Item API' do
  describe 'Random Endpoint' do
    it 'returns a random transaction' do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)
      item = create(:item,
                  merchant_id: merchant.id)
      invoice_item = create(:invoice_item,
                invoice_id: invoice.id,
                item_id: item.id)

      get "/api/v1/invoice_items/random"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response["id"]).to eq(invoice_item.id)
    end
  end
end
