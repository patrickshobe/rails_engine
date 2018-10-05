require 'rails_helper'

describe 'Items API' do
  describe 'Items Invoice Items' do
    it 'should show all invoice items for the item ' do
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


      get "/api/v1/items/#{item.id}/invoice_items"

      expect(response).to be_successful

      invoice_items = JSON.parse(response.body)

      expect(invoice_items.first["id"]).to eq(invoice_item.id)
    end
  end
end
