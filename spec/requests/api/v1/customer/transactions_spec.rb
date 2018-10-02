require 'rails_helper'

describe 'Customer API' do
  describe 'Customer Invoices' do
    it 'should show all transactions for the customer' do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice_1 = create(:invoice,
                       customer_id: customer.id,
                       merchant_id: merchant.id)
      invoice_2 = create(:invoice,
                       customer_id: customer.id,
                       merchant_id: merchant.id)
      transaction_1 = create(:transaction,
                           invoice_id: invoice_1.id)
      transaction_2 = create(:transaction,
                           invoice_id: invoice_2.id)


      get "/api/v1/customers/#{customer.id}/transactions"

      expect(response).to be_successful

      transactions = JSON.parse(response.body)

      expect(transactions.first["id"]).to eq(transaction_1.id)
      expect(transactions.last["id"]).to eq(transaction_2.id)
    end
  end
end
