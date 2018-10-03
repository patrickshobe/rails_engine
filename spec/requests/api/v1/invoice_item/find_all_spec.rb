require 'rails_helper'

describe 'Invoice Item API' do
  describe 'Find all endpoints' do
    it "it can find all invoice_items by id" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)
      item = create(:item,
                  merchant_id: merchant.id)
      invoices = create_list(:invoice_item,
                  3,
                invoice_id: invoice.id,
                item_id: item.id)


      get "/api/v1/invoice_items/find_all?id=#{invoices.first.id}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response.first["id"]).to eq(invoices.first.id)
    end
    it "it can find all invoice_items by item_id" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)
      item = create(:item,
                  merchant_id: merchant.id)
      invoices = create_list(:invoice_item,
                  3,
                invoice_id: invoice.id,
                item_id: item.id)


      get "/api/v1/invoice_items/find_all?item_id=#{invoices.first.item_id}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response.first["id"]).to eq(invoices.first.id)
      expect(invoice_response.count).to eq(3)
    end
    it "it can find all invoice_items by invoice_id" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)
      item = create(:item,
                  merchant_id: merchant.id)
      invoices = create_list(:invoice_item,
                  3,
                invoice_id: invoice.id,
                item_id: item.id)


      get "/api/v1/invoice_items/find_all?invoice_id=#{invoices.first.invoice_id}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response.first["id"]).to eq(invoices.first.id)
      expect(invoice_response.count).to eq(3)
    end
    it "it can find all invoice_items by unit_price" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)
      item = create(:item,
                  merchant_id: merchant.id)
      invoices = create_list(:invoice_item,
                  3,
                invoice_id: invoice.id,
                item_id: item.id)


      get "/api/v1/invoice_items/find_all?unit_price=#{invoices.first.unit_price}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response.first["id"]).to eq(invoices.first.id)
      expect(invoice_response.count).to eq(3)
    end
    it "it can find all invoice_items by quantity" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       merchant_id: merchant.id,
                     customer_id: customer.id)
      item = create(:item,
                  merchant_id: merchant.id)
      invoices = create_list(:invoice_item,
                  3,
                invoice_id: invoice.id,
                item_id: item.id)


      get "/api/v1/invoice_items/find_all?quantity=#{invoices.first.quantity}"

      expect(response).to be_successful

      invoice_response = JSON.parse(response.body)

      expect(invoice_response.first["id"]).to eq(invoices.first.id)
      expect(invoice_response.count).to eq(3)
    end
  end
end
