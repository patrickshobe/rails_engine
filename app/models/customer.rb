class Customer < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name

  has_many :invoices, dependent: :destroy
  has_many :transactions, through: :invoices

  def self.favorite_merchant(customer_id)
    Merchant
      .select("merchants.*, COUNT(invoices.id) AS invoice_count")
      .joins(invoices: :transactions)
      .where(invoices: { customer_id: customer_id },
             transactions: { result: 'success' })
      .group(:id)
      .order("invoice_count DESC")
      .limit(1).first
  end
end
