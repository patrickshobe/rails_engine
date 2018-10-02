require 'rails_helper'

describe 'Customer API' do
  describe 'Customer Invoices' do
    it 'should show all invoices for the customer' do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice_1 = create(:invoice,
                       customer_id: customer.id,
                       merchant_id: merchant.id)
      invoice_2 = create(:invoice,
                       customer_id: customer.id,
                       merchant_id: merchant.id)


      get "/api/v1/customers/#{customer.id}/invoices"

      expect(response).to be_successful

      invoices = JSON.parse(response.body)

      expect(invoices.first["id"]).to eq(invoice_1.id)
      expect(invoices.last["id"]).to eq(invoice_2.id)
    end
  end
end
