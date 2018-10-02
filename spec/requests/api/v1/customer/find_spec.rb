require 'rails_helper'

describe 'Customer API' do
  describe 'Find endpoints' do
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
    it "it can find a single user by last_name" do
      name = create(:customer).last_name

      get "/api/v1/customers/find?last_name=#{name}"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer["last_name"]).to eq(name)
    end
    it "it can find a single user by created_at" do
      create_list(:customer, 3)
      cust = Customer.create!(first_name: 'Bart',
                             last_name: 'Simpson',
                             created_at: '2017-01-01 00:00:00',
                             updated_at: '2017-01-01 00:00:00')

      get "/api/v1/customers/find?created_at=#{cust.created_at}"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer["first_name"]).to eq(cust.first_name)
    end
    it "it can find a single user by updated_at" do
      create_list(:customer, 3)
      cust = Customer.create!(first_name: 'Bart',
                             last_name: 'Simpson',
                             created_at: '2017-01-01 00:00:00',
                             updated_at: '2017-01-01 00:00:00')

      get "/api/v1/customers/find?updated_at=#{cust.updated_at}"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer["first_name"]).to eq(cust.first_name)
    end
  end
end
