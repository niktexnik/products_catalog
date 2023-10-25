FactoryBot.define do
  factory :user_admin do
    sequence(:email) { |n| "email_admin#{n}@l-tex.com" }
    password { '12345678' }
    password_confirmation { '12345678' }
  end
end
