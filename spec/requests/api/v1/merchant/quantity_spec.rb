require 'rails_helper'

describe 'Merchant API' do
  context 'Quantity Route' do
    it 'should return the quantity' do
      @merchant_1 = create(:merchant)
      @merchant_2 = create(:merchant)

      @customer = create(:customer)

      @item_1 = create(:item, merchant: @merchant_1)
      @item_2 = create(:item, merchant: @merchant_2)

      @invoice_1 = create(:invoice, customer: @customer, merchant: @merchant_1)
      @invoice_2 = create(:invoice, customer: @customer, merchant: @merchant_1)
      @invoice_3 = create(:invoice, customer: @customer, merchant: @merchant_2)

      @invoice_item_1 = create(:invoice_item, item: @item_1, invoice: @invoice_1)
      @invoice_item_2 = create(:invoice_item, item: @item_1, invoice: @invoice_1)
      @invoice_item_3 = create(:invoice_item, item: @item_2, invoice: @invoice_3)

      @transaction_1 = create(:transaction, invoice: @invoice_1, result: "success")
      @transaction_2 = create(:transaction, invoice: @invoice_1, result: "success")
      @transaction_3 = create(:transaction, invoice: @invoice_3, result: "success")

      get "/api/v1/merchants/most_revenue?quantity=2"

      expect(response).to be_successful

      merchant_response = JSON.parse(response.body)

      expect(merchant_response.first["id"]).to equal(1)
    end
  end
end
