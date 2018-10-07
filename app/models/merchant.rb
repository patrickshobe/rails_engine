class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :invoices, dependent: :destroy
  has_many :invoice_items, through: :invoices
  has_many :items, dependent: :destroy
  has_many :transactions, through: :invoices

  def self.most_revenue(limit = 5)
    select("merchants.*,
           sum(invoice_items.quantity * invoice_items.unit_price) as revenue")
      .joins(:invoice_items)
      .group(:id)
      .order('revenue desc')
      .limit(limit)
  end

  def self.most_items(limit = 5)

    find_by_sql("SELECT
                          merchants.*,
                          SUM(invoice_items.quantity) AS sum
                          from merchants
                          join invoices on invoices.merchant_id = merchants.id
                          join invoice_items ON invoice_items.invoice_id = invoices.id
                          join transactions ON transactions.invoice_id = invoices.id
                          where transactions.result = 'success'
                          group by merchants.id
                          order by sum desc
                          limit #{limit};")
  end

  def self.total_revenue(params)
    find_by_sql("SELECT to_char(invoices.created_at, 'YYYY-MM-DD') as invoice_date,
                          sum(invoice_items.quantity * invoice_items.unit_price) as revenue
                          from invoices
                          join invoice_items ON invoice_items.invoice_id = invoices.id
                          join transactions ON transactions.invoice_id = invoices.id
                          where transactions.result = 'success'
                          and to_char(invoices.created_at, 'YYYY-MM-DD') = '#{params}'
                          group by invoice_date;").first.revenue
  end
end
