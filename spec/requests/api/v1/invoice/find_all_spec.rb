require 'rails_helper'

describe 'Invoice API' do
  describe 'Find all endpoints' do
    it "it can find all invoices id" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoices = create_list(:invoice,
                             3,
                             merchant_id: merchant.id,
                             customer_id: customer.id)


      get "/api/v1/invoices/find_all?id=#{invoices.first.id}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response.first["id"]).to eq(invoices.first.id)
    end
    it "it can find all invoices by customer_id" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoices = create_list(:invoice,
                             3,
                             merchant_id: merchant.id,
                             customer_id: customer.id)


      get "/api/v1/invoices/find_all?customer_id=#{invoices.first.customer_id}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response.first["id"]).to eq(invoices.first.id)
      expect(invoice_response.length).to eq(3)
    end
    it "it can find all invoices by merchant_id" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoices = create_list(:invoice,
                             3,
                             merchant_id: merchant.id,
                             customer_id: customer.id)


      get "/api/v1/invoices/find_all?merchant_id=#{invoices.first.merchant_id}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response.first["id"]).to eq(invoices.first.id)
      expect(invoice_response.length).to eq(3)
    end
    it "it can find all invoices by status" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoices = create_list(:invoice,
                             3,
                             merchant_id: merchant.id,
                             customer_id: customer.id)


      get "/api/v1/invoices/find_all?status=#{invoices.first.status}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response.first["id"]).to eq(invoices.first.id)
      expect(invoice_response.length).to eq(3)
    end
    it "it can find all invoices by created_at" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoices = create_list(:invoice,
                             3,
                             merchant_id: merchant.id,
                             customer_id: customer.id,
                            created_at: '2017-01-01 00:00:00')


      get "/api/v1/invoices/find_all?created_at=#{invoices.first.created_at}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response.first["id"]).to eq(invoices.first.id)
      expect(invoice_response.length).to eq(3)
    end
    it "it can find all invoices by updated" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoices = create_list(:invoice,
                             3,
                             merchant_id: merchant.id,
                             customer_id: customer.id,
                            updated_at: '2017-01-01 00:00:00')


      get "/api/v1/invoices/find_all?updated_at=#{invoices.first.updated_at}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response.first["id"]).to eq(invoices.first.id)
      expect(invoice_response.length).to eq(3)
    end
  end
end
