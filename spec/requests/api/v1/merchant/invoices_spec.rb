require 'rails_helper'

describe 'Merchant API' do
  describe 'merchant invoice' do
    it 'should show the invoices for the merchants' do
      merchant = create(:merchant)
      customer = create(:customer)
      invoices = create_list(:invoice,
                             3,
                             merchant_id: merchant.id,
                             customer_id: customer.id)



      get "/api/v1/merchants/#{merchant.id}/invoices"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response.first["id"]).to eq(invoices.first.id)
    end
  end
end
