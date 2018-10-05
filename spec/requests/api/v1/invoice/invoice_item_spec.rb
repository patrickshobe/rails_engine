require 'rails_helper'

describe 'Invoice API' do
  describe 'Invoice Invoice-Items' do
    it 'should show all invoice_items for the Invoice' do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       customer_id: customer.id,
                       merchant_id: merchant.id)
      item = create(:item,
                    merchant_id: merchant.id)
      invoice_item = create_list(:invoice_item,
                                 3,
                                 invoice_id: invoice.id,
                                 item_id: item.id)



      get "/api/v1/invoices/#{invoice.id}/invoice_items"

      expect(response).to be_successful

      invoice_items = JSON.parse(response.body)

      expect(invoice_items.first["id"]).to eq(invoice_item.first.id)
    end
  end
end
