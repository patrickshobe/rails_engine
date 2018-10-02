require 'rails_helper'

describe 'Customer API' do
  describe 'Customer Invoices' do
    it 'should show all invoices for the transaction' do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                     merchant_id: merchant.id,
                     customer_id: customer.id)
      transact = Transaction.create!(invoice_id: invoice.id,
                                     credit_card_number: 1234,
                                     credit_card_expiration_date: '2017-01-01 00:00:00',
                                     created_at: '2017-01-01 00:00:00',
                                     updated_at: '2017-01-01 00:00:00',
                                     result: 'Success')


      get "/api/v1/transactions/#{transact.id}/invoices"

      expect(response).to be_successful

      transactions = JSON.parse(response.body)

      expect(transactions["id"]).to eq(transact.id)
    end
  end
end
