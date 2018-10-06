class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :invoices, dependent: :destroy
  has_many :invoice_items, through: :invoices
  has_many :items, dependent: :destroy

  def self.most_revenue(limit = 5)
    select("merchants.*,
           sum(invoice_items.quantity * invoice_items.unit_price) as revenue")
      .joins(:invoice_items)
      .group(:id)
      .order('revenue desc')
      .limit(limit)
  end
end
