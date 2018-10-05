require 'rails_helper'

describe "items API" do
  it "sends a list of items" do
    merchant = create(:merchant)
    create_list(:item,
                3,
                merchant_id: merchant.id)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end
  it "it returns a single item" do
    merchant = create(:merchant)
    id = create(:item,
                merchant_id: merchant.id).id

    get "/api/v1/items/#{id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(id)
  end
end

