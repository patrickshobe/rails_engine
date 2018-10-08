class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :unit_price

  def self.best_items(limit = 5)
    find_by_sql("SELECT
                          items.*,
                          sum(invoice_items.quantity) as sold_count
                          from items
                          join invoice_items ON invoice_items.item_id = items.id
                          join transactions on transactions.invoice_id = invoice_items.invoice_id
                          where transactions.result = 'success'
                          group by items.id
                          order by sold_count desc
                          limit #{limit};")
  end
end
