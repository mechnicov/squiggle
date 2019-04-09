FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Some name #{n}" }
    sequence(:slug) { |n| "Some slug #{n}" }
  end
end
