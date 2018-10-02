require 'CSV'
namespace :import do
  desc "TODO"
  task all: :environment do
    Customer.destroy_all
    Merchant.destroy_all
    Invoice.destroy_all
    Item.destroy_all

    CSV.foreach('./data/customers.csv', headers: true) do |row|
      Customer.create(row.to_h)
    end

    CSV.foreach('./data/merchants.csv', headers: true) do |row|
      Merchant.create(row.to_h)
    end

    CSV.foreach('./data/invoices.csv', headers: true) do |row|
      Invoice.create(row.to_h)
    end

    CSV.foreach('./data/items.csv', headers: true) do |row|
      Item.create(row.to_h)
    end
  end
end
