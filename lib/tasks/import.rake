require 'CSV'
namespace :import do
  desc "TODO"
  task all: :environment do
    puts "Inserting Customers"
    CSV.foreach('./data/customers.csv', headers: true) do |row|
      Customer.create(row.to_h)
    end
    puts "Customers Inserted: #{Customer.count}"

    puts "Inserting Merchants"

    CSV.foreach('./data/merchants.csv', headers: true) do |row|
      Merchant.create(row.to_h)
    end
    puts "Merchants Inserted: #{Merchant.count}"

    puts "Inserting Invoices"
    CSV.foreach('./data/invoices.csv', headers: true) do |row|
      Invoice.create(row.to_h)
    end
    puts "Invoices Inserted: #{Invoice.count}"

    puts "Inserting Items"
    CSV.foreach('./data/items.csv', headers: true) do |row|
      row["unit_price"] = row["unit_price"].to_f / 100
      Item.create(row.to_h)
    end
    puts "Items Inserted: #{Item.count}"

    puts 'Inserting Invoice Items'

    CSV.foreach('./data/invoice_items.csv', headers: true) do |row|
      row["unit_price"] = row["unit_price"].to_f / 100
      InvoiceItem.create(row.to_h)
    end
    puts "Invoice Items Inserted: #{InvoiceItem.count}"

    puts 'Inserting Transactions'
    CSV.foreach('./data/transactions.csv', headers: true) do |row|
      Transaction.create!(row.to_h)
    end
    puts "Transactions Inserted: #{Transaction.count}"

    puts 'All Data Inserted'
  end
end
