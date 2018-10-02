require 'rails_helper'

describe "Transaction API" do
  it "sends a list of transaction" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice,
                     merchant_id: merchant.id,
                     customer_id: customer.id)
    create_list(:transaction, 3, invoice_id: invoice.id)

    get '/api/v1/transactions'

    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)
  end
  it "it returns a single transactions" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice,
                     merchant_id: merchant.id,
                     customer_id: customer.id)
    transaction = create(:transaction, invoice_id: invoice.id)

    get "/api/v1/transactions/#{transaction.id}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions["id"]).to eq(transaction.id)
  end
end

