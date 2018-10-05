require 'rails_helper'

describe 'Invoice API' do
  describe 'Invoice Customer' do
    it 'should show all Custoemrs for the Invoice' do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       customer_id: customer.id,
                       merchant_id: merchant.id)


      get "/api/v1/invoices/#{invoice.id}/customers"

      expect(response).to be_successful

      customers = JSON.parse(response.body)

      expect(customers["id"]).to eq(customer.id)
    end
  end
end
