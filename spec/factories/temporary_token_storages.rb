FactoryBot.define do
  factory :temporary_token_storage do
    sequence(:email) { |n| "rspec#{n}@l-tex.com" }
    code { '123456' }
    token { SecureRandom.base58(24) }
  end
end
