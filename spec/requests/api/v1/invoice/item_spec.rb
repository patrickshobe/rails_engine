require 'rails_helper'

describe 'Invoice API' do
  describe 'Invoice Items' do
    it 'should show all Items for the Invoice' do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice,
                       customer_id: customer.id,
                       merchant_id: merchant.id)
      item = create(:item,
                    merchant_id: merchant.id)
      invoice_item = create(:invoice_item,
                            invoice_id: invoice.id,
                            item_id: item.id)


      get "/api/v1/invoices/#{invoice.id}/items"

      expect(response).to be_successful

      items = JSON.parse(response.body)

      expect(items.first["id"]).to eq(item.id)
    end
  end
end
