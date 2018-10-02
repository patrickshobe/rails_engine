require 'rails_helper'

describe 'Transaction API' do
  describe 'Find endpoints' do
    it "it can find a all transactions by id" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                     merchant_id: merchant.id,
                     customer_id: customer.id)
      id = create(:transaction, invoice_id: invoice.id).id

      get "/api/v1/transactions/find_all?id=#{id}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction.first["id"]).to eq(id)
    end
    it "it can find a all transactions by name" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                     merchant_id: merchant.id,
                     customer_id: customer.id)
      card_number = create(:transaction, invoice_id: invoice.id).credit_card_number

      get "/api/v1/transactions/find_all?credit_card_number=#{card_number}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction.first["credit_card_number"]).to eq(card_number)
    end
    it "it can find a all transactions by last_name" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                     merchant_id: merchant.id,
                     customer_id: customer.id)
      transact = Transaction.create!(invoice_id: invoice.id,
                                     credit_card_number: 1234,
                                     credit_card_expiration_date: '2017-01-01 00:00:00',
                                     result: 'Success')

      get "/api/v1/transactions/find_all?credit_card_expiration_date=#{transact.credit_card_expiration_date}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction.first["credit_card_number"]).to eq(transact.credit_card_number)
    end
    it "it can find a all transactions by created_at" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                     merchant_id: merchant.id,
                     customer_id: customer.id)
      transact = Transaction.create!(invoice_id: invoice.id,
                                     credit_card_number: 1234,
                                     credit_card_expiration_date: '2017-01-01 00:00:00',
                                     created_at: '2017-01-01 00:00:00',
                                     result: 'Success')

      get "/api/v1/transactions/find_all?created_at=#{transact.created_at}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction.first["credit_card_number"]).to eq(transact.credit_card_number)
    end
    it "it can find a all transactions by updated_at" do
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

      get "/api/v1/transactions/find_all?updated_at=#{transact.updated_at}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction.first["credit_card_number"]).to eq(transact.credit_card_number)
    end
  end
end
