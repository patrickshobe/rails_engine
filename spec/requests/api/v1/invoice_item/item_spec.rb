require 'rails_helper'

describe 'invoice item api' do
  describe 'invoice item items' do
    it 'should show all invoices for the invoice_item' do
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


      get "/api/v1/invoice_items/#{invoice_item.id}/item"

      expect(response).to be_successful

      invoices = JSON.parse(response.body)

      expect(invoices["id"]).to eq(invoice.id)
    end
  end
end
