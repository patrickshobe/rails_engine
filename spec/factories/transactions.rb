FactoryBot.define do
  factory :transaction do
    invoice { nil }
    credit_card_number { 1 }
    credit_card_expiration_date { "2018-10-01 19:11:25" }
    result { "MyString" }
  end
end
