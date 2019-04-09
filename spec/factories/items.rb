FactoryBot.define do
  factory :item do
    price { 10_000 }
    sequence(:name) { |n| "Some name #{n}" }
    sequence(:slug) { |n| "Some slug #{n}" }
  end
end
