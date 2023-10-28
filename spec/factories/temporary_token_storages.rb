FactoryBot.define do
  factory :temporary_token_storage do
    email { "rspec@l-tex.com" }
    code { '123456' }
    token { 'qwerty12345678' }
  end
end
