require 'rails_helper'

describe "Invoice API" do
  it "sends a list of Invocies" do
    customer = create(:customer)
    merchant = create(:merchant)
    create_list(:invoice,
                3,
                customer_id: customer.id,
                merchant_id: merchant.id)

    get '/api/v1/invoices'

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(3)
  end
  it "it returns a single invoice" do
    customer = create(:customer)
    merchant = create(:merchant)
    id = create(:invoice,
                customer_id: customer.id,
                merchant_id: merchant.id).id

    get "/api/v1/invoices/#{id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["id"]).to eq(id)
  end
end

