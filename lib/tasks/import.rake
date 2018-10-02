require 'CSV'
namespace :import do
  desc "TODO"
  task all: :environment do
    CSV.foreach('./data/customers.csv', headers: true) do |row|
      Customer.create(row)
    end
  end
end
