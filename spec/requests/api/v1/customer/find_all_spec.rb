require 'rails_helper'

describe 'Customer API' do
  describe 'Find all endpoints' do
    it "it can find all user by id" do
      id = create(:customer).id


      get "/api/v1/customers/find_all?id=#{id}"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer.first["id"]).to eq(id)
    end
    it "it can find all user by name" do
      customers = create_list(:customer, 3)
      name = customers.first.first_name

      get "/api/v1/customers/find_all?first_name=#{name}"

      expect(response).to be_successful

      customers_response = JSON.parse(response.body)

      expect(customers_response.length).to eq(3)
      expect(customers.first["first_name"]).to eq(name)
    end
    it "it can find all user by last_name" do
      customers = create_list(:customer, 3)
      name = customers.first.last_name

      get "/api/v1/customers/find_all?last_name=#{name}"

      expect(response).to be_successful

      customers_response = JSON.parse(response.body)

      expect(customers_response.length).to eq(3)
      expect(customers.first["last_name"]).to eq(name)
    end
    it "it can find all user by created_at" do
      customers = create_list(:customer, 3)
      cust = Customer.create!(first_name: 'Bart',
                             last_name: 'Simpson',
                             created_at: '2017-01-01 00:00:00',
                             updated_at: '2017-01-01 00:00:00')
      Customer.create!(first_name: 'Bart',
                             last_name: 'Simpson',
                             created_at: '2017-01-01 00:00:00',
                             updated_at: '2017-01-01 00:00:00')
      name = cust.first_name

      get "/api/v1/customers/find_all?created_at=#{cust.created_at}"

      expect(response).to be_successful

      customers_response = JSON.parse(response.body)

      expect(customers_response.length).to eq(2)
      expect(customers_response.first["first_name"]).to eq(name)
    end
    it "it can find all user by updated_at" do
      customers = create_list(:customer, 3)
      cust = Customer.create!(first_name: 'Bart',
                             last_name: 'Simpson',
                             created_at: '2017-01-01 00:00:00',
                             updated_at: '2017-01-01 00:00:00')
      Customer.create!(first_name: 'Bart',
                             last_name: 'Simpson',
                             created_at: '2017-01-01 00:00:00',
                             updated_at: '2017-01-01 00:00:00')
      name = cust.first_name

      get "/api/v1/customers/find_all?updated_at=#{cust.updated_at}"

      expect(response).to be_successful

      customers_response = JSON.parse(response.body)

      expect(customers_response.length).to eq(2)
      expect(customers_response.first["first_name"]).to eq(name)
    end
  end
end
