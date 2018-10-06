require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :invoices }
    it { should have_many :items }
  end

  describe 'class methods' do
    before(:each) do
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
    end

    it '.most revenue' do
      expect(Merchant.most_revenue(2).first.id).to equal(1)
      expect(Merchant.most_revenue(2).first.revenue.to_f).to equal(2247.46)
    end
  end
end
