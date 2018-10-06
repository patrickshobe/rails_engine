FactoryBot.define do
  factory :item do
    name { "Comic Book" }
    description { "It's about super heros" }
    unit_price { 11234.76 }
    merchant
  end
end
