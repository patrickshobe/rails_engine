require 'rails_helper'

describe 'Invoice-Item API' do
  describe 'Find endpoints' do
    it "it can find a single invoice-item by id" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)
      item = create(:item,
                  merchant_id: merchant.id)
      invoice_item = create(:invoice_item,
                invoice_id: invoice.id,
                item_id: item.id)

      get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response["id"]).to eq(invoice_item.id)
    end
    it "it can find a single invoice-item by item_id" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)
      item = create(:item,
                  merchant_id: merchant.id)
      invoice_item = create(:invoice_item,
                invoice_id: invoice.id,
                item_id: item.id)

      get "/api/v1/invoice_items/find?item_id=#{invoice_item.item_id}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response["id"]).to eq(invoice_item.id)
    end
    it "it can find a single invoice-item by invoice_id" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)
      item = create(:item,
                  merchant_id: merchant.id)
      invoice_item = create(:invoice_item,
                invoice_id: invoice.id,
                item_id: item.id)

      get "/api/v1/invoice_items/find?invoice_id=#{invoice_item.invoice_id}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response["id"]).to eq(invoice_item.id)
    end
    it "it can find a single invoice-item by quantity" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)
      item = create(:item,
                  merchant_id: merchant.id)
      invoice_item = create(:invoice_item,
                invoice_id: invoice.id,
                item_id: item.id)

      get "/api/v1/invoice_items/find?quantity=#{invoice_item.quantity}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response["id"]).to eq(invoice_item.id)
    end
    it "it can find a single invoice-item by unit_price" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)
      item = create(:item,
                  merchant_id: merchant.id)
      invoice_item = create(:invoice_item,
                invoice_id: invoice.id,
                item_id: item.id)

      get "/api/v1/invoice_items/find?unit_price=#{invoice_item.unit_price}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response["id"]).to eq(invoice_item.id)
    end
    it "it can find a single invoice-item by created_at" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)
      item = create(:item,
                  merchant_id: merchant.id)
      invoice_item = create(:invoice_item,
                invoice_id: invoice.id,
                item_id: item.id,
                           created_at: '20177-01-01 00:00:00')

      get "/api/v1/invoice_items/find?created_at=#{invoice_item.created_at}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response["id"]).to eq(invoice_item.id)
    end
    it "it can find a single invoice-item by updated_at" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)
      item = create(:item,
                  merchant_id: merchant.id)
      invoice_item = create(:invoice_item,
                invoice_id: invoice.id,
                item_id: item.id,
                           updated_at: '20177-01-01 00:00:00')

      get "/api/v1/invoice_items/find?updated_at=#{invoice_item.updated_at}"

      expect(response).to be_successful

      item_response = JSON.parse(response.body)

      expect(item_response["id"]).to eq(invoice_item.id)
    end
  end
end
