require 'rails_helper'

describe "Customer API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_successful

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(3)
  end
  it "it returns a single customer" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(id)
  end
  it "it can find a single user by id" do
    id = create(:customer).id

    get "/api/v1/customers/find?id=#{id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(id)
  end
  it "it can find a single user by name" do
    name = create(:customer).first_name

    get "/api/v1/customers/find?first_name=#{name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["first_name"]).to eq(name)
  end
end

