require 'rails_helper'

describe "Invoice-Item API" do
  it "sends a list of Invoice Items" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice,
                     merchant_id: merchant.id,
                     customer_id: customer.id)
    item = create(:item,
                  merchant_id: merchant.id)
    create_list(:invoice_item,
                3,
                invoice_id: invoice.id,
                item_id: item.id)

    get '/api/v1/invoice_items'

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(3)
  end
  it "it returns a single invoice item" do
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

    get "/api/v1/invoice_items/#{invoice_item.id}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)

    expect(invoice_items["id"]).to eq(invoice_item.id)
  end
end

