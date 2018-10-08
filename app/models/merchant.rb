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

	def self.favorite_customer(merchant_id)
    Customer
          .select("customers.*, COUNT(invoices.id) AS order_count")
          .joins(invoices: :transactions)
          .where(invoices: { merchant_id: merchant_id }, transactions: { result: 'success'})
          .group(:id)
          .order("order_count DESC")
          .limit(1)
          .first
  end

  def self.merchant_revenue(merchant_id)
    find_by_sql("SELECT
                          SUM(invoice_items.quantity * invoice_items.unit_price) as sum
                          from merchants
                          join invoices ON invoices.merchant_id = merchants.id
                          join invoice_items ON invoice_items.invoice_id = invoices.id
                          join transactions ON transactions.invoice_id = invoices.id
                          where transactions.result = 'success'
                          and merchants.id = #{merchant_id}
                          group by merchants.id;").first
  end

  def self.merchant_revenue_date(parameters)
    find_by_sql("SELECT
                          SUM(invoice_items.quantity * invoice_items.unit_price) as sum
                          from merchants
                          join invoices ON invoices.merchant_id = merchants.id
                          join invoice_items ON invoice_items.invoice_id = invoices.id
                          join transactions ON transactions.invoice_id = invoices.id
                          where transactions.result = 'success'
                          and merchants.id = #{parameters[:merchant_id]}
                          and to_char(invoices.created_at, 'YYYY-MM-DD') = '#{parameters[:date]}'
                          group by merchants.id;").first
  end

  def self.pending_invoices(merchant_id)
    Customer.find_by_sql("SELECT customers.* FROM customers
      INNER JOIN invoices ON customers.id=invoices.customer_id
      INNER JOIN transactions ON transactions.invoice_id=invoices.id
      INNER JOIN merchants ON merchants.id=invoices.merchant_id
      WHERE merchants.id=#{merchant_id} AND transactions.result='failed'
      EXCEPT
      SELECT customers.* FROM customers
      INNER JOIN invoices ON customers.id=invoices.customer_id
      INNER JOIN transactions ON transactions.invoice_id=invoices.id
      INNER JOIN merchants ON merchants.id=invoices.merchant_id
      WHERE merchants.id=#{merchant_id} AND transactions.result='success'")
  end
end
