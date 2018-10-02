require 'CSV'
namespace :import do
  desc "TODO"
  task all: :environment do
    Customer.destroy_all
    Merchant.destroy_all
    CSV.foreach('./data/customers.csv', headers: true) do |row|
      Customer.create(row.to_h)
    end

    CSV.foreach('./data/merchants.csv', headers: true) do |row|
      Merchant.create(row.to_h)
    end
  end
end
