require 'rails_helper'

describe 'Invoice API' do
  describe 'Invoice Transactions' do
    it 'should show all transactions for the Invoice' do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice_1 = create(:invoice,
                       customer_id: customer.id,
                       merchant_id: merchant.id)
      transaction_1 = create(:transaction,
                           invoice_id: invoice_1.id)


      get "/api/v1/invoices/#{invoice_1.id}/transactions"

      expect(response).to be_successful

      transactions = JSON.parse(response.body)

      expect(transactions.first["id"]).to eq(transaction_1.id)
    end
  end
end
