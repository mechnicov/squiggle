FactoryBot.define do
  factory :user do
    email { "user_#{rand(1000)}@example.com" }
    after(:build) { |u| u.password_confirmation = u.password = "123456"}
  end
end
