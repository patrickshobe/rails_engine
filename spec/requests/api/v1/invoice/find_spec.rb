require 'rails_helper'

describe 'Invoice API' do
  describe 'Find endpoints' do
    it "it can find a single invoice by id" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)

      get "/api/v1/invoices/find?id=#{invoice.id}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response["id"]).to eq(invoice.id)
    end
    it "it can find a single invoice by customer_id" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)

      get "/api/v1/invoices/find?customer_id=#{customer.id}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response["id"]).to eq(invoice.id)
    end
    it "it can find a single invoice by merchant_id" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)

      get "/api/v1/invoices/find?merchant_id=#{customer.id}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response["id"]).to eq(invoice.id)
    end
    it "it can find a single invoice by status" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)

      get "/api/v1/invoices/find?status=#{invoice.status}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response["id"]).to eq(invoice.id)
    end
    it "it can find a single invoice by created_at" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id,
                      created_at: '2017-01-01 00:00:00')

      get "/api/v1/invoices/find?created_at=#{invoice.created_at}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response["id"]).to eq(invoice.id)
    end
    it "it can find a single invoice by updated_at" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id,
                      updated_at: '2017-01-01 00:00:00')

      get "/api/v1/invoices/find?updated_at=#{invoice.updated_at}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response["id"]).to eq(invoice.id)
    end
  end
end
