require 'rails_helper'

describe 'Invoice API' do
  describe 'Invoice merchant' do
    it 'should show all merchant for the Invoice' do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       customer_id: customer.id,
                       merchant_id: merchant.id)


      get "/api/v1/invoices/#{invoice.id}/merchants"

      expect(response).to be_successful

      merchant_response = JSON.parse(response.body)

      expect(merchant_response["id"]).to eq(merchant.id)
    end
  end
end
