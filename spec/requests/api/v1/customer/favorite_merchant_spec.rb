require 'rails_helper'

describe 'Customer API' do
  describe 'Customer Invoices' do
    it 'should show all transactions for the customer' do
      customer = create(:customer)
      favorite_merchant = create(:merchant, name: 'Paul')
      merchant = create(:merchant)
      invoice_1 = create(:invoice,
                       customer_id: customer.id,
                       merchant_id: favorite_merchant.id)
      invoice_2 = create(:invoice,
                       customer_id: customer.id,
                       merchant_id: merchant.id)
      invoice_3 = create(:invoice,
                       customer_id: customer.id,
                       merchant_id: favorite_merchant.id)
      create(:transaction,
                           invoice_id: invoice_1.id,
                           result: 'Success')
      create(:transaction,
                           invoice_id: invoice_2.id,
                            result: 'Success')
      create(:transaction,
                           invoice_id: invoice_3.id,
                            result: 'Success')


      get "/api/v1/customers/#{customer.id}/favorite_merchant"

      expect(response).to be_successful

      merchant_response = JSON.parse(response.body)

      expect(merchant_response["id"]).to eq(favorite_merchant.id)
    end
  end
end
